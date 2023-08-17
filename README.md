# GEE-PICX

GEE-PICX is ... (more description)

## Open GEE-PICX application via [this link](https://code.earthengine.google.com/8f2dafed903a6bf35f8ed63e54082778)

If you follow that link, you can open the application in Google Earth Engine's code editor mode. In case you are not already logged in to your Google account, you will be asked to log in before you are directed to the application interface.
(If the application interface does not appear next to the map, you need to hit "Run" on top the code editor to start the application.)

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/1_open_app.PNG">

Then you can choose all parameters according to your requirements on the application interface next to the map.

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/2_choose_parameters.PNG">

When hitting the export button, two image collections will appear in the *Console* tab in the upper-right window and can be further inspected. The first one includes all single images that are filtered according to your input, the second one includes the composites that can be exported (in this case only one aggregated scene).

<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/3_choose_parameters.PNG">

To initiate the final export to the your Google Drive, you must go to the *Tasks* tab and click "Run" at each image (in this case only one). A pop-up window will appear, where you can further modify the name, coordinate system, or scale. It might be helpful to add the name of the study area or other characteristic parameters to not get confused later on. 


<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/4_export.PNG">



<img src="https://github.com/Luisa-del/GEE-PICX/blob/main/img/5_visualization.PNG">









Figure S1: A: GEE-PICX application interface in Code Editor mode when opening script link. Parameters can be modified by the user in the grey box on the map. B: Visualization of NDVI band of GEE-PICX products on the map. Modification of layer visualization parameters can be applied in the layer panel box on the map (setting icon).

Figure S2: A: Inspect single image collection as well as aggregated image collection for export in the Console tab (upper-right window). The image collections appear in the Console after clicking in “Raster export” or “Visualization” in grey box on the map. B: Initiate each image export to Google Drive from the Tasks tab by clicking “Run”. Users can optionally modify the preset parameters in the pop-up window.




Further information on how to work with Google Earth Engine and website construction can be found in the Earth Engine guides.
* [Get Started with Earth Engine](https://developers.google.com/earth-engine/guides/getstarted)
* [Earth Engine Code Editor](https://developers.google.com/earth-engine/guides/playground)
* [Exporting Images](https://developers.google.com/earth-engine/guides/exporting_images)
