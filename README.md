# GEE-PICX 

***G**oogle **E**arth **E**ngine - **P**henological **I**maging and **C**loud-free **X**port*

## Overview

**GEE-PICX is a Google Earth Engine web application for generating and exporting cloud-free and analysis-ready composites of satellite images for user-defined areas and time steps with global data coverage.**

We followed four design principles in developing GEE-PICX:
1. **Flexibility of user input.** Users have control over choice of satellite platform (Landsat or Sentinel-2), study area boundaries, time range, maximum cloud cover (for single images), aggregation mode, and image bands. Relevant images are automatically selected from the data catalog according to user input.
2. **Ease of use.** The application features a self-explanatory interface, requires only a Google account, a web browser and internet connection, and has no hardware or software requirements thanks to server-side processing.
3. **Export of large data sets.** Only limited by Google drive storage capacity.
4. **Generate analysis-ready data.** Generates cloud-free image mosaics with spectral bands, spectral indices, and a valid-pixel band for quality assessment (more info see [Appendix](#5-Appendix)). Export image resolution and coordinate reference system are customizable.

The application allows users without experience in remote sensing to generate cloud-free and analysis-ready image composites for custom study areas and points in time for a multitude of applications in ecology and beyond. 

Below you can find a find step-by-step tutorial on how to open and work in the application using two case studies.

1. [How-to-open GEE-PICX](#1-How-to-open-GEE-PICX)
2. [Default parameters](#2-Default-parameters)
3. [Example tutorials](#Example-tutorials)
    1. [Case study (1): Create single-season image composite for city of Würzburg, Germany.](#31-case-study-1)
    2. [Case study (2): Create multi-annual image composites for an area in the Amazon rainforest, Ariquemes, Brazil.](#32-case-study-2)
4. [Important-to-know & further information](#4-important-to-know--further-information)
5. [Appendix](#5-Appendix)


![](".png")
 
## 1. How-to-open GEE-PICX 

* Option 1: Follow [this link](https://code.earthengine.google.com/03e9dbbd69ca3c0b9955cca6caf9fb45) and open the application in Google Earth Engine's code editor mode (click run).
* Option 2: Add the GEE-PICX repository to your Google Earth Engine account by clicking on this link: [https://code.earthengine.google.com/?accept_repo=users/gisizw/GEE-PICX](https://code.earthengine.google.com/?accept_repo=users/gisizw/GEE-PICX) (it will appear under the "Reader" tab in the left window, then click run). *Code License: Apache 2.0.*
* Option 3: Copy the source code from [here](https://github.com/EcoDynIZW/GEE-PICX/blob/main/source_code/GEE_PICX_code) and paste it to Google Earth Engine's code editor (click run).

* In case you are not already logged in to your Google account, you will be asked to log in and/or register a cloud project before you are directed to the application interface.

* If the application interface does not appear next to the map, you need to hit "Run" on top the code editor to start the application.

*Figure: Start page of GEE-PICX web application.*
<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/open_app.png">


![](".png")

## 2. Default parameters

* Then you can select the parameters according to your requirements in the box next to the map. 

*Figure: Default parameters in box with description.*
<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/default_interface5.png">


![](".png")

## 3. Example tutorials 


### 3.1 Case study (1)

**Create single-season image composite for city of Würzburg, Germany.** 

(context: cropland monitoring)

In this example we want to create a single winter season image composite for the city of Würzburg, Germany. But before we can set all parameters, we need to import our study area to Google Earth Engine.

![](".png")

#### a. Upload shapefile as asset to Googe Earth Engine

* Download the shapefile of city of Würzburg from [this website](https://opendata.wuerzburg.de/explore/dataset/altstadt/export/) to your local computer.
* Go to the *Assets*-tab in the top-left window and click "New" (1) --> "Shape files" (2).
* A window will pop up from where you can "Select" (3) your study area shapefile from your local computer. Select all required extentions and click "Upload" (4).

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/import_asset.png"> 

* You can then go to the *Tasks*-tab in the top-right window and wait until the shapefile upload is finished (this symbol ✓ should appear (5) ).
* Your new asset should be listed now in the *Assets*-tab, if not click the "Refresh" symbol (6) and it should appear at the given name.
* In order to access the study area asset from the application, we need to copy the file path. This can be done by clicking on the file in the *Assets*-tab (7) and copying the file path from the pop-up window (8). Close (9) the window afterwards to continue.

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/import_asset_path.png">

![](".png")

#### b. Select parameters

* Now we can select all parameters *(Sentinel-2, path-to-asset, december 2022 - february 2023 (winter), 100 % cloud cover, default band selection, median, 10m resolution, UTM)*. All these parameters do not have to be specified in the given order.

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/parameter_example1.png">

![](".png")

#### c. Export image

* When clicking "Raster export" (1), two image collections will appear in the *Console*-tab in the upper-right window and can be further inspected.
* The first one (a) includes all single images that were filtered according to the user input, the second one (b) includes the composite image that can be exported.
* In this example 35 satellite images (cloud cover 100%) were aggregated to one scene covering Würzburg (Germany) in the winter season. 

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/print_example1.png">

* To initiate the final image export to your Google Drive, you must go to the *Tasks*-tab and click "Run" (2) at each image (in this case only one).
* A pop-up window with default settings will appear, where you can further modify names, coordinate system, scale, or Google drive folder. It might be helpful to add the name of the study area or other characteristic parameters to not get confused later on when exporting more images. The default drive folder "GEE_Export" will be created automatically if not already existing.
* Click "Run" (3) again, and the image will be processed and exported to the Google drive folder. 

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/export_example1.png">

![](".png")

#### d. Visualize image on map (optional)

* GEE-PICX offers the opportunity to visualize the image composite on the map (before or after the export).
* You can either "Select a band combination" (1) or "Select a vegetation index" (2) by which the image composite(s) will be added to the map. Whatever option you choose, all layers will be added to the map.
* In the layer panel box on the map you can either (un)select each layer by removing this symbol ✓ (3), or make them transparent with the fader.
* If you click on the "Settings" button (4), a window will pop up where you can modify the default visualisation parameters.

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/vis3_example1.png">


![](".png")

### 3.2 Case study (2)

**Create multi-annual image composites for an area in the Amazon rainforest, Ariquemes, Brazil.** 

(context: deforestation monitoring)

In this example we want to create multi annual image composites for a deforested area in the Amazon rainforest, north of Ariquemes, Brazil. In this example, we want to draw our study area on the map in the application instead of using an asset like in the previous example. 

![](".png")

#### a. Draw study area on map in Google Earth Engine

When the application is opened, zoom in on Brazil and optionally switch to satellite mode (1) to better recognize deforestation patterns. After click "Draw your aoi" (2) you can draw one (or more) rectangle(s) on the map (3). A "geomtry"-variable will appear on top of the the code editor (3) which contains information about the geomtry of the new study area. In case you want to re-draw your study area, click "Clear your aoi" (4), then the "geomtry"-variable will disappear and you can again "Draw your aoi" (2).

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/example2_draw_polygon.png">

![](".png")

#### b. Select parameters

* Now we can select all other parameters *(Sentinel-2, year range 1992 - 2002,  month range 1 - 12 (annual image composites for eleven years), 65 % cloud cover, default band selection, median, 30m resolution, UTM)*. All these parameters (including drawing the study area) do not have to be specified in the given order.

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/example2_parameter.png">

![](".png")

#### c. Export images

* When clicking "Raster export" (1), two image collections will appear in the *Console*-tab in the upper-right window and can be further inspected.
* The first one includes all single images that were filtered according to the user input, the second one includes the composite images that can be exported.
* In this example 539 satellite images (cloud cover 65%) were aggregated to eleven annual scenes, covering an area north of Ariquemes, Brazil.
* The acquisition date of the respective images of the single image collection can be found in the last section of the respective names (yyyymmdd), under "features".

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/example2_print.png">

* To initiate the final image export to your Google Drive, you must go to the *Tasks*-tab and click "Run" (2) at each image (in this case eleven times if you want to download them all).
* A pop-up window with default settings will appear each time, where you can further modify names, coordinate system, scale, or Google drive folder. It might be helpful to add the name of the study area or other characteristic parameters to not get confused later on when exporting more images. The default drive folder "GEE_Export" will be created automatically if not already existing.
* Click "Run" (3) again, and the image will be processed and exported to the Google drive folder.
* Multiple images can be exported in parallel.

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/example2_export.png">

![](".png")

#### d. Visualize images on map (optional)

* GEE-PICX offers the opportunity to visualize the image composites on the map (before or after the export).
* You can either "Select a band combination" or "Select a vegetation index" (1) by which the image composite(s) will be added to the map. Whatever option you choose, all layers will be added to the map.
* In the layer panel box on the map you can either (un)select each layer by removing this symbol ✓ (2), or make them transparent with the fader.
* If you click on the "Settings" button (3), a window will pop up where you can modify the default visualisation parameters.

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/example2_vis.png">

*Figure: Comparison of annual GEE-PICX image composites from 1992 to 2002 reveals an increasing deforestation pattern.*
<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/example2_ts.png">

![](".png")

## 4. Important-to-know & further information

You should keep this in mind when exporting image composites from or visualizing them in GEE-PICX application:

* Multiple image exports run in parallel and depending on study area size, length of time frame each export can take from minutes to hours (or even days for study regions measuring hundreds of thousands of square kilometers).
* When exporting large datasets, Google Earth Engine splits each image into smaller tiles. After downloading them from Google drive, they can either be merged to a large contiguous mosaic, or be used as a virtual raster.
* All band values of the export images are multiplied by 10,000, except for the valid pixel band. Whenn visualising the data in the application, all spectral indices have a valid value range from -1 to 1 and the wavelength range of the spectral bands are specified in µm.
* The valid-pixel band indicates the valid scenes per pixel of the image composite and can be used for data quality assessment.
* Data gaps ("no data") in the image composites will be displayed as 0 in the exported images, which could affect subsequent analyses. The 0_to_NA.R script offers an opportunity to convert all 0 to NA in the R Environment. *(Data gaps occur when a pixel is covered by clouds in all images over the entire time frame, because the applied cloud mask detects and filters out all clouds before aggregation.)*
* Google Earth Engine may encounter computational problems for visualization if the data is too large due to the size of the study area and/or the length of the time period. This may lead to scaling error messages and some objects would not be displayed on the map (or also Console). Visualization problems, however, do not affect image exports, which are always possible and only limited by the storage capacity of the user’s Google drive.
* Typical scaling errors are *Computation timed out*, *Too many concurrent aggregations*, *User memory limit exceeded*, or *An internal error has occurred*. If one of these message appears in the print console or layer panel, your data is too big to be listed or visualised in the application. It might be helpful to reduce or split the length of the time frame or the size of the study area. **Exporting the data, however, is still possible!!**

![](".png")

**Further information on how to work with Google Earth Engine and website construction can be found in the Earth Engine guides.**
* Get Started with Earth Engine: [https://developers.google.com/earth-engine/guides/getstarted](https://developers.google.com/earth-engine/guides/getstarted)
* Earth Engine Code Editor: [https://developers.google.com/earth-engine/guides/playground](https://developers.google.com/earth-engine/guides/playground)
* Exporting Images: [https://developers.google.com/earth-engine/guides/exporting_images](https://developers.google.com/earth-engine/guides/exporting_images)
* Upload polygon (shapefile) to GEE: [https://developers.google.com/earthengine/guides/table_upload](https://developers.google.com/earthengine/guides/table_upload)
* Manage assets and make public: [https://developers.google.com/earth-engine/guides/asset_manager](https://developers.google.com/earth-engine/guides/asset_manager)


![](".png")

## 5. Appendix

*Table: Available spectral indices derived from Landsat or Sentinel-2 imagery.*

Band name | Full name | Formula | Interpretation
--- | --- | --- | ---
NDVI | Normalized Difference Vegetation Index | (NIR-Red)(NIR+Red) | Highlights density  and health of photosynthetically active vegetation. Tends to saturate in densely vegetated areas. Sensitive to the contribution of soil brightness and atmospheric effects. 
EVI2 | Enhanced Vegetation Index 2 | 2,4*(NIR-Red)(NIR+Red+1) | Highlights photosynthetically active vegetation, but does not saturate in densely vegetated areas. Accounts for soil brightness variation. Less affected by atmospheric effects than NDVI and EVI. 
SAVI | Soil-Adjusted Vegetation Index | (NIR-Red)(NIR+Red+L)*(1+L) | Highlights photosynthetically active vegetation and accounts for soil brightness variation. 
MSAVI | Modified Soil-Adjusted Vegetation Index | (NIR-Red)(NIR+Red+L0) *(1+L0) | Modified version of SAVI to further minimize the soil background influences on the vegetation signal.
NDMI | Normalized Difference Moisture Index | (NIR-SWIR1)(NIR+SWIR1) | Sensitive to moisture levels  in vegetation and soil. Useful for vegetation analyses, for identifying areas prone to drought stress or excess moisture.
NBR | Normalized Burn Ratio | (NIR-SWIR2)(NIR+SWIR2) | Detects and quantifies burnt areas. In general, low NBR values indicate recently burnt areas and bare ground. 
NBR2 | Normalized Burn Ratio 2 | (SWIR1-SWIR2)(SWIR1+SWIR2) | A modification of the NBR, useful in postfire recovery studies, highlights vegetation with high water content.
BSI | Bare Soil Index | (SWIR1+Red)-(NIR+Blue)(SWIR1+Red)+(NIR+Blue) | Highlights bare ground and rock surfaces. Useful in identification of soil erosion, land degradation, and urbanization processes.
NDWI | Normalized Difference Water Index | (Green-NIR)(Green+NIR) | Sensitive to water bodies. Useful for water resource management, wetland monitoring, and flood assessment. 



