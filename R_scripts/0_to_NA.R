#######################
### Convert 0 to NA ###
### Luisa Pflumm    ###
### 23.08.2023      ###
#######################


### USER INPUT ===============================================================================

# Load library
library(terra)

# Set path to raster (exported from GEE-PICX and downloaded to local drive from Google Drive)
path <- "path-to-raster.tif"




### CONVERT 0 TO NA ===============================================================================

# Define raster
r <- terra::rast(path)

# Replace all rows where "valid_pixels" contain zero with NA
# --> if valid_pixel band not contained in raster, use another band name
r[r$valid_pixels == 0] <- NA

# Add "_NA" to file name and export 'new' raster
path_out <- gsub(".tif$", "_NA.tif", path)
terra::writeRaster(r, path_out, datatype = "INT2S")

