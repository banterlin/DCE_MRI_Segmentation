clc;clear all;

disp('Initialising, please wait...')
%%%%%%%%%%%%%%%320X320X24 Pixel size Unit in mm3
Volume_ratio = 0.625 * 0.625 * 4;

%%%%%%%%%%%%%%% Left(Image 1) Default Slice No.
image1_s = 10;

%%%%%%%%%%%%%%% Left Default Time Interval
image1_t = 5;

%%%%%%%%%%%%%%% Right Default Slice No.
% image2_s = 10;

%%%%%%%%%%%%%%% Right Default Time Interval
image2_t = 10;

%%%%%%%%%%%%%%% Default segmentation threshold
corr_threshold = 0.95;

%%%%%%%%%%%%%%% Default Tumour Filtering Factor
filter_size_Vtumour = 75;

%%%%%%%%%%%%%%% Default Blood Filtering Factor
filter_size_Vblood = 25;

%%%%%%%%%%%%%%% Default Muscle Filtering Factor
filter_size_Vmuscle = 35;

UIwork;
pause(0.01);
clc;