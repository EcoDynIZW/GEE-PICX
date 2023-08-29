# GEE-PICX 

***P**henological **I**maging and **C**loud-free **X**port*

**GEE-PICX is a Google Earth Engine web application for generating and exporting cloud-free and analysis-ready composites of satellite images for user-defined areas and time steps with global data coverage.**

We followed four design principles in developing GEE-PICX:
1. **Flexibility of user input.** Users have control over choice of satellite platform (Landsat or Sentinel-2), study area boundaries, time range, maximum cloud cover (for single images), aggregation mode, and image bands. Relevant images are automatically selected from the data catalog according to user input.
2. **Ease of use.** The application features a self-explanatory interface, requires only a Google account, a web browser and internet connection, and has no hardware or software requirements thanks to server-side processing.
3. **Export of large data sets.** Only limited by Google drive storage capacity.
4. **Generate analysis-ready data.** Generates cloud-free image mosaics with spectral bands, spectral indices, and a quality assessment band (valid scenes per pixel). Export image resolution and coordinate reference system are customizable.

The application allows users without experience in remote sensing to generate cloud-free and analysis-ready image composites for custom study areas and points in time for a multitude of applications in ecology and beyond. 

Below you can find a find step-by-step tutorial on how to open and work in the application using two case studies.



 
## 1. How-to-open GEE-PICX 

* Follow [this link](https://code.earthengine.google.com/ccfd3131bf258087a4027d2c4539c1e5) and open the application in Google Earth Engine's code editor mode.
* In case you are not already logged in to your Google account, you will be asked to log in or set up an account before you are directed to the application interface
* If the application interface does not appear next to the map, you need to hit "Run" on top the code editor to start the application.

*Figure: Start page of GEE-PICX web application.*
<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/1_open_app.PNG">




## 2. Default parameters

* Then you can select the parameters according to your requirements in the box next to the map. 

*Figure: Default parameters in box with description.*
<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/default_interface5.png">




## 3. Example tutorials 


### 3.1 Case study (1)

**Create single-season image composite for city of Würzburg, Germany**

In this example we want to create a single winter season image composite for the city of Würzburg, Germany. But before we can set all parameters, we need to import our study area to Google Earth Engine.


#### a. Upload shapefile as asset to Googe Earth Engine

* Download the shapefile of city of Würzburg from [this website](https://opendata.wuerzburg.de/explore/dataset/altstadt/export/) to your local computer.
* Go to the *Assets*-tab in the top-left window and click (1) "New" --> (2) "Shape files".
* A window will pop up from where you can (3) "Select" your study area shapefile from your local computer. Select all required extentions and click (4) "Upload".

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/import_asset.png"> 

* You can then go to the *Tasks*-tab in the top-right window and wait until the shapefile upload is finished (this symbol ✓ (5) should appear).
* Your new asset should be listed now in the *Assets*-tab, if not click (6) the "Refresh" button and it should appear at the given name.
* In order to access the study area asset from the application, we need to copy the file path. This can be done by (7) clicking on the file in the *Assets*-tab and (8) copying the file path from the pop-up window. (9) Close the window afterwards to continue.

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/import_asset_path.png">



#### b. Select parameters

* Now we can select all parameters *(Sentinel-2, path-to-asset, december 2022 - february 2023 (winter), 100 % cloud cover, default band selection, median, 10m resolution, UTM (EPSG: 32632))*

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/parameter_example1.png">



#### c. Export image

* When clicking (1) "Raster export", two image collections will appear in the *Console*-tab in the upper-right window and can be further inspected.
* The first one (a) includes all single images that were filtered according to the user input, the second one (b) includes the composite image that can be exported.
* In this example 35 satellite images (cloud cover 100%) were aggregated to one scene for the winter season in Würzburg, Germany. 

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/print_example1.png">

* To initiate the final image export to your Google Drive, you must go to the *Tasks*-tab and click (2) "Run" at each image (in this case only one).
* A pop-up window with default setting will appear, but here you can further modify names, coordinate system, scale, or Google drive golder. It might be helpful to add the name of the study area or other characteristic parameters to not get confused later on when exporting more images. The default drive folder "GEE_Export" will be created automatically if not already existing.
* Click (3) "Run" again, and the image will be processed and exported to the Google drive folder. 

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/export_example1.png">



#### d. Visualize image on map (optional)

* GEE-PICX offers the opportunity to visualize the image composite(s) on the map prior to the export.
* You can either (1) "Select a band combination" or (2) "Select a vegetation index" by which the image composite(s) will be added to the map. Whatever option you choose, the layer will be added to the map.
* In the layer panel box on the map you can either (un)select each layer by removing this symbol ✓ (3), or make them transparent with the fader.
* If you click on the (4) "Settings" button, a window will pop up where you can modify the default visualisation parameters.

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/vis3_example1.png">




### 3.2 Case study (2)

**Create multi-annual image composites for an area in the Amazon rainforest, Ariquemes, Brazil**



#### a. Draw study area on map in Google Earth Engine



#### b. Select parameters



#### c. Export images



#### d. Visualize images on map (optional)




## 4. Important-To-Know when exporting & visualising image composites

* Multiple image exports run in parallel and depending on study area size, length of time frame each export can take from minutes to hours (or even days for study regions measuring hundreds of thousands of square kilometers).
* When exporting large datasets, Google Earth Engine splits each image into smaller tiles. After downloading them from Google drive, they can either be merged to a large contiguous mosaic, or be used as a virtual raster.
* All indices have a valid value range from -1 to 1 in the application. All band values of export images are multiplied by 10,000 except for the valid pixel band.
* Google Earth Engine may encounter computational problems for visualization if the data is too large due to the size of the study area and/or the length of the time period. This may lead to scaling error messages and some objects would not be displayed on the map (or also Console). Visualization problems, however, do not affect image exports, which are always possible and only limited by the storage capacity of the user’s Google drive.
* Typical scaling errors are *Computation timed out*, *Too many concurrent aggregations*, *User memory limit exceeded*, or *An internal error has occurred*. If one of these message appear in the print console, or the browser in which you opened the app tells you 


Further information on how to work with Google Earth Engine and website construction can be found in the Earth Engine guides.
* [Get Started with Earth Engine](https://developers.google.com/earth-engine/guides/getstarted)
* [Earth Engine Code Editor](https://developers.google.com/earth-engine/guides/playground)
* [Exporting Images](https://developers.google.com/earth-engine/guides/exporting_images)
* [Asset Manager](https://developers.google.com/earth-engine/guides/asset_manager)




## 5. Appendix

*Table: Available spectral indices derived from Landsat or Sentinel-2 imagery.*

Band name | Full name | Formula | Interpretation
--- | --- | --- | ---
NDVI | Normalized Difference Vegetation Index | (NIR-Red)(NIR+Red) | Highlights density  and health of photosynthetically active vegetation. Tends to saturate in densely vegetated areas. Sensitive to the contribution of soil brightness and atmospheric effects (Petropulos & Kalaitzidis 2011). 
EVI2 | Enhanced Vegetation Index 2 | 2,4*(NIR-Red)(NIR+Red+1) | Highlights photosynthetically active vegetation, but does not saturate in densely vegetated areas. Accounts for soil brightness variation. Less affected by atmospheric effects than NDVI and EVI. 
SAVI | Soil-Adjusted Vegetation Index | (NIR-Red)(NIR+Red+L)*(1+L) | Highlights photosynthetically active vegetation and accounts for soil brightness variation. 
MSAVI | Modified Soil-Adjusted Vegetation Index | (NIR-Red)(NIR+Red+L0) *(1+L0) | Modified version of SAVI to further minimize the soil background influences on the vegetation signal (Qi et al., 1994).
NDMI | Normalized Difference Moisture Index | (NIR-SWIR1)(NIR+SWIR1) | Sensitive to moisture levels  in vegetation and soil. Useful for vegetation analyses, for identifying areas prone to drought stress or excess moisture.
NBR | Normalized Burn Ratio | (NIR-SWIR2)(NIR+SWIR2) | Detects and quantifies burnt areas. In general, low NBR values indicate recently burnt areas and bare ground (Keeley, 2009). 
NBR2 | Normalized Burn Ratio 2 | (SWIR1-SWIR2)(SWIR1+SWIR2) | A modification of the NBR, useful in postfire recovery studies, highlights vegetation with high water content (USGS, 2022c).
BSI | Bare Soil Index | (SWIR1+Red)-(NIR+Blue)(SWIR1+Red)+(NIR+Blue) | Highlights bare ground and rock surfaces. Useful in identification of soil erosion, land degradation, and urbanization processes.
NDWI | Normalized Difference Water Index | (Green-NIR)(Green+NIR) | Sensitive to water bodies. Useful for water resource management, wetland monitoring, and flood assessment. 


