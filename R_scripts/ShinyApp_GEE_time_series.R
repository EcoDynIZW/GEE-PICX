#' Open a Shiny app for visualizing satellite image time series
#'
#' A Shiny app to visualize satellite image time series (single band or RGB) 
#' with one map per year.
#' Values are constantly extracted and plotted at mouse location. The map can be
#' animated via the play button.

#' @param dir Directory containing a time series of .tif images
#' @param years years to show (without gaps)
#' @param band single band name (e.g. "NDVI" or three values, e.g. c("R", "G", "B")
#'
#' @return
#' @export
#' 
#' @details This app is a companion to the publication 
#' Pflumm, L., Kang, H., Wilting, A., Niedballa, J. (XXXX). GEE-PICX: Generating 
#' cloud-free Sentinel-2 and Landsat image composites and spectral indices for 
#' custom areas and time frames - a Google Earth Engine web application

#' 
#' @author Juergen Niedballa
#'
#' @examples
#' 
#' dir = "C:/Path/to/images"
#' years = seq(1990, 2022)
#' 
#'  # 1 band
#'  GEE_time_series(
#'   dir = dir,
#'   years = years,
#'   band = "NDVI"
#'   )
#'
#'  # 3 bands
#'  GEE_time_series(
#'    dir = dir,
#'    years = 2010:2022,
#'    band = c("NIR", "R", "G")
#'    )


GEE_time_series <- function(dir, 
                        years, 
                        band){
  
  
  library(shiny)
  library(terra)
  library(leaflet)
  
  # define function for creating a multi-band raster of a single spectral band / index, one band = one year
  # can be used to e.g. create a multi-band raster of NDVI, with one band per year
  
  get_index_from_timeseries <- function(dir, years, band) {
    lf <- list.files(dir, pattern = ".tif$")
    
    r_list <- lapply(file.path(dir, lf), rast)
    
    if(length(band) == 1){
      index_list <- lapply(r_list, FUN = function(x) x[[band]])
      names(index_list) <- years
      r_index <- rast(index_list)
      # r_index
    }
    
    if(length(band) == 3){
      index_list_b1 <- lapply(r_list, FUN = function(x) x[[band[1]]])
      index_list_b2 <- lapply(r_list, FUN = function(x) x[[band[2]]])
      index_list_b3 <- lapply(r_list, FUN = function(x) x[[band[3]]])
      
      names(index_list_b1) <- names(index_list_b2) <- names(index_list_b3) <- years
      r_index_b1 <- rast(index_list_b1)
      r_index_b2 <- rast(index_list_b2)
      r_index_b3 <- rast(index_list_b3)
      
      r_index <- lapply(1:length(years), 
                             FUN = function(x) {
        out <- c(index_list_b1[[x]],
                 index_list_b2[[x]],
                 index_list_b3[[x]])
        names(out) <- band
        out 
      })
      names(r_index) <- years
    }
    return(r_index)
  }
  
  # apply function to folder
  r_index <- get_index_from_timeseries(dir = dir,
                                       years = years,
                                       band = band)
  
  # Define UI
  ui <- fluidPage(
    plotOutput("map", hover = "map_hover"),
    plotOutput("plot"),
  
    fluidRow(
      column(6, sliderInput("layer", "Layer:", min = 1, 
                            max = ifelse(length(band) == 1, 
                                         nlyr(r_index), 
                                         length(r_index)), 
                                     value = 1, step = 1, 
                            animate =   animationOptions(
                              interval = 500,
                              loop = F 
                            ))),
      column(6, sliderInput("zlim", "Value range:", 
                            min = -10000, max = 10000, 
                            value = c(0,  10000), 
                            step = 200))
    )
  )
  
  # Define server logic
  server <- function(input, output, session) {
    # Create reactive value to store clicked coordinates
    coords <- reactiveVal(NULL)
    
    if(length(band) == 1){
      # aggregate for faster plotting
      r_index_resample <- aggregate(r_index, 3, mean, na.rm = T)
      }
    
    if(length(band) == 3){
      # remove values > 10000 (data errors)
      
      r_index_resample <- lapply(r_index, aggregate, 3, mean, na.rm = T)
      
      r_index_resample <- lapply(r_index_resample, 
                                 FUN = function(x){
                                   x[x > 10000] <- NA
                                   x })
      # scale  all values to 0-255
      r_index_resample  <- lapply(r_index_resample ,
                                  FUN = function(x) x / (10000 / 255))

    }
    
    
    if(length(band) == 1) {
      output$map <- renderPlot({
        terra::plot(r_index_resample[[input$layer]], 
             col = hcl.colors(100), 
             range = input$zlim,
             main = names(r_index_resample)[input$layer])
      })
    }
    
    if(length(band) == 3) {
      output$map <- renderPlot({
        plotRGB(r_index_resample[[input$layer]], 
             main = names(r_index_resample)[input$layer])
        
      })
    }
    
    
     
    # Update hovered coordinates when mouse is moved over map
    observeEvent(input$map_hover, {
      coords(data.frame(x = input$map_hover$x, 
                        y = input$map_hover$y))
    })
    
    # Create plot with extracted values
    if(length(band) == 1) {
      output$plot <- renderPlot({
        if (!is.null(coords())) {
          vals <- t(extract(r_index_resample, coords(), ID = F, raw = T))
          plot(vals ~ rownames(vals), 
               type = "b", 
               xlab = "Year", 
               ylab = band,
               ylim = input$zlim)
          abline(v = rownames(vals)[input$layer], col = "red")
        }
      })
    }
    
    if(length(band) == 3) {
      output$plot <- renderPlot({
        if (!is.null(coords())) {

          vals <- t(sapply(r_index_resample, extract, coords(), ID = F, raw = T))
          vals <- vals * (10000 / 255)
          plot(vals[,1] ~ rownames(vals), 
               type = "b", 
               xlab = "Year", 
               ylab = "Index",
               ylim = input$zlim, 
               col = "red")
          par(new = T)
          plot(vals[,2] ~ rownames(vals), 
               type = "b", 
               xlab = "Year", 
               ylab = "Index",
               ylim = input$zlim,
               col = "green")
          par(new = T)
          plot(vals[,3] ~ rownames(vals), 
               type = "b", 
               xlab = "Year", 
               ylab = "Index",
               ylim = input$zlim,
               col = "blue")
          
          abline(v = rownames(vals)[input$layer], col = "grey")
        }
      })
    }
  }
  
  # Run the application 
  shinyApp(ui = ui, server = server)
}