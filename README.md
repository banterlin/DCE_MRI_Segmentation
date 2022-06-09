# DCE_MRI_Segmentation
   Segmentation toolbox developed to segment tissues from the lower abdominal area imaged by DCE-MRI.

For each step, check the Status window to make sure status not BUSY. The status window will update in real time whenever the algorithm is processing.
Algorithm parameters are set by default in MAIN.m , run MAIN, wait for the interface to load. These parameters can be updated in the GUI later on.
1. Click the Load data button and select the mat file from patient.
2.Adjust the slider to switch to the desired slice/time. The Slice of the two images are synced by the button below figure A.
3. Click the Draw *** button， to draw the ROI for the designated tissue on the figure B. After each drawing, the plot in the upper right corner of the interface will be automatically updated in real time. Note extra tissue does not need to be drawn for the algorithm to work, it is there as an extra feature for certain situations.. Click the Draw *** buttons again will enable redraw; (2) The ROI on the right can be moved, and vertices of the ROI can also be moved and ROI can be stretch. Click Update ROI after each change to ROI, will update their TIC on the top right figure. It is recommended to draw 4 ~ 6 points for each ROI.
4. Click popup curve for full screen view of the TICs within the reference ROI.
5. Click Corroef Seg to start segmentation based on reference drawn. The Number next to the button determines the threshold, the bigger the threshold the less noisy it will be, however more likely to miss important information. Segmentation should finish processing in seconds.
6. Click DRAWMU3D to show 3D modelling of the segmented tissues. By default, the algorithm will only show blood and tumour, by ticking ‘show muscle’ option, the algorithm will show the extra tissue. The figure below the first 3D model shows the filtered 3D model, it will use the default filtering parameters. Note these parameters can be changed on the left of the button, and the 3D model will be updated in real time as the parameters change, there is no need to manually update the model.
7. Click popup3D, the algorithm will first output the volume of blood and tumour segmented. Then two figures will pop up, the first figure shows the segmented 3D model after filter being applied in full screen. The second figure will show the effect of segmentation and filtering on TIC of the tumour.
8. 2D view of segmented tissues.(Slice Selection available through 12.2)
Shorter Version
Black banner above 12A shows the real time status window.
12.1 Load Dataset
12.2 Slice/Time Selection
12.3 Draw Reference ROIs, Update Reference ROIs(after making adjustments on 12B)
12.4 Detailed reference TIC visualisation.(Analysed from reference ROI)
12.5 Segmentation
12.6 3-D Filtering and 3-D Modelling of the segmented tissues.(Including Filter parameters manual adjustment)
12.7 Detailed full-screen 3-D view of the segmented tissue and TIC of segmented tumour (including volume calculation for blood and tumour).
