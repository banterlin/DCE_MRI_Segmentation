% DrawTumour3D

h.f1.CurrentAxes = h.ax4;cla;hold on;

h.p0status2.String = 'BUSY:3D Draw is running...';pause(0.01);
h.p0status2.String = 'BUSY:3D Draw Tumour is running...';pause(0.01);
isosurface(MU_tumour,1e-5);axis off;
h.p0status2.String = 'BUSY:3D Draw Blood is running...';pause(0.01);
isosurface(MU_blood,1e-5);axis off;
if exist('MU_muscle','var')&&h.p2checkbox.Value
    h.p0status2.String = 'BUSY:3D Draw Muscle is running...';pause(0.01);
    isosurface(MU_muscle,1e-5);axis off;
end
xlim([0,320]);
ylim([0,320]);
zlim([0,24]);
h_patch = findobj(gca,'type','Patch');
try
    set(h_patch(3),'Facecolor',[0,0,0]);
    set(h_patch(2),'Facecolor',[1,0,0]);
    set(h_patch(1),'Facecolor',[0,1,0]);
catch
    set(h_patch(2),'Facecolor',[0,0,0]);
    set(h_patch(1),'Facecolor',[1,0,0]);
end

set(h_patch,'FaceAlpha',0.3);

h.f1.CurrentAxes = h.ax5;cla;hold on;

h.p0status2.String = 'BUSY:3D Draw is running...';pause(0.01);
h.p0status2.String = 'BUSY:3D Draw Tumour is running...';pause(0.01);
MU_tumour2 = Volume_filter(  MU_tumour  ,fix(h.p2filter1.Value));
isosurface(MU_tumour2,1e-5);axis off;
h.p0status2.String = 'BUSY:3D Draw Blood is running...';pause(0.01);
MU_blood2 = Volume_filter(  MU_blood  ,fix(h.p2filter2.Value));
isosurface(MU_blood2,1e-5);axis off;
if exist('MU_muscle','var')&&h.p2checkbox.Value
    h.p0status2.String = 'BUSY:3D Draw Muscle is running...';pause(0.01);
    MU_muscle2 = Volume_filter(  MU_muscle  ,fix(h.p2filter3.Value));
    isosurface(MU_muscle2,1e-5);axis off;
end
xlim([0,320]);
ylim([0,320]);
zlim([0,24]);
h_patch = findobj(gca,'type','Patch');
try
    set(h_patch(3),'Facecolor',[0,0,0]);
    set(h_patch(2),'Facecolor',[1,0,0]);
    set(h_patch(1),'Facecolor',[0,1,0]);
catch
    set(h_patch(2),'Facecolor',[0,0,0]);
    set(h_patch(1),'Facecolor',[1,0,0]);
end

set(h_patch,'FaceAlpha',0.3);


cameratoolbar('Show');
cameratoolbar('SetMode','Orbit');


disp('3D Draw: Done!');
h.p0status2.String = '3D Draw Tumour: Done!';pause(0.01);