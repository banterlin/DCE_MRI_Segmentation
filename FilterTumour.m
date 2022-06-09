tic;
h.f1.CurrentAxes = h.ax5;
h.p0status2.String = 'BUSY:Filtering MU_tumour...';pause(0.01);
MU_tumour2 = Volume_filter(MU_tumour,fix(h.p2filter1.Value));
isotemp = isosurface(MU_tumour2,1e-5);
if exist('MU_muscle2','var')
    set(h_patch(3),'Faces',isotemp.faces,'Vertices',isotemp.vertices);
else
    set(h_patch(2),'Faces',isotemp.faces,'Vertices',isotemp.vertices);
end
h.p2filter1text.String = ['Tumour Filter: ',num2str(fix(h.p2filter1.Value))];
h.p0status2.String = 'DONE:Filtering MU_tumour.';pause(0.01);
disp('Filtering MU_tumour: Done!');
toc;