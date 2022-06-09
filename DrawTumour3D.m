% DrawTumour3D
h.p0status2.String = '3D Draw is running...';pause(0.01);
disp('Corroef work: Done!');
h.f1.CurrentAxes = h.ax4;
hold on;
iso1 = isosurface(MU_tumour,1e-5);axis off;
cameratoolbar('Show');
cameratoolbar('SetMode','Orbit');
h.p0status2.String = '3D Draw Tumour: Done!';pause(0.01);


h_patch = findobj(gca,'type','Patch');
set(h_patch(1),'Facecolor',[0,0,0]);         
set(h_patch(2),'Facecolor',[1,0,0]);          
set(h_patch(3),'Facecolor',[0,1,0]); 
set(h_patch,'FaceAlpha',0.3);

disp('3D Draw: Done!');