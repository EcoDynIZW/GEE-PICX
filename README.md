# GEE-PICX *(Phenological Imaging and Cloud-free Xport)*

GEE-PICX is a Google Earth Engine web application for generating and exporting cloud-free and analysis-ready composites of satellite images for user-defined areas and time steps with global data coverage. 

We followed four design principles in developing GEE-PICX:
1. **Flexibility of user input.** Users have control over choice of satellite platform (Landsat or Sentinel-2), study area boundaries, time range, maximum cloud cover (for single images), aggregation mode, and image bands. Relevant images are automatically selected from the data catalog according to user input.
2. **Ease of use.** The application features a self-explanatory interface, requires only a Google account, a web browser and internet connection, and has no hardware or software requirements thanks to server-side processing.
3. **Export of large data sets.** Only limited by Google drive storage capacity.
4. **Generate analysis-ready data.** Generates cloud-free image mosaics with spectral bands, spectral indices, and a quality assessment band (valid scenes per pixel). Export image resolution and coordinate reference system are customizable.

The application allows users without experience in remote sensing to generate cloud-free and analysis-ready image composites for custom study areas and points in time for a multitude of applications in ecology and beyond.

 
## 1. How to open GEE-PICX application 

Follow [this link](https://code.earthengine.google.com/ccfd3131bf258087a4027d2c4539c1e5) and open the application in Google Earth Engine's code editor mode. In case you are not already logged in to your Google account, you will be asked to log in or set up an account before you are directed to the application interface:

*(If the application interface does not appear next to the map, you need to hit "Run" on top the code editor to start the application)*

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/1_open_app.PNG">

## 2. Default parameters

Then you can select the parameters according to your requirements in the application interface box.

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/default_interface4.png">

## 3. Example tutorials 

### 3.1 Example (1): Create single-season image composite for city of Würzburg

#### a. Download shapefile of city of Würzburg from [here](https://opendata.wuerzburg.de/explore/dataset/altstadt/export/) and upload it as an asset to Googe Earth Engine.
<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/import_asset.png"> 
<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/copy_path.png">
<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/insert_path.png">

#### b. Select parameters in GEE-PICX interface
<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/....png">

#### c. Export image to Google Drive

When hitting the Export button, two image collections will appear in the *Console* tab in the upper-right window and can be further inspected. The first one includes all single images that are filtered according to your input, the second one includes the composites that can be exported (in this example only one aggregated scene):

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/3_choose_parameters.PNG">

To initiate the final export to the your Google Drive, you must go to the *Tasks* tab and click "Run" at each image (in this case only one). A pop-up window will appear, where you can further modify the name, coordinate system, or scale. It might be helpful to add the name of the study area or other characteristic parameters to not get confused later on when exporting multiple images. 


<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/4_export.PNG">



#### d. Optional: visualize image on map in Google Earth Engine

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/5_visualization.PNG">




### 3.2 Example (2): Create multi-annual image composites for an area in the Amazon rainforest, Ariquemes, Brazil

#### a. Draw your study area on map in Google Earth Engine

#### b. Select parameters in GEE-PICX interface

#### c. Export images to Google Drive

#### d. Optional: visualize images on map in Google Earth Engine






Further information on how to work with Google Earth Engine and website construction can be found in the Earth Engine guides.
* [Get Started with Earth Engine](https://developers.google.com/earth-engine/guides/getstarted)
* [Earth Engine Code Editor](https://developers.google.com/earth-engine/guides/playground)
* [Exporting Images](https://developers.google.com/earth-engine/guides/exporting_images)
* [Asset Manager](https://developers.google.com/earth-engine/guides/asset_manager)
