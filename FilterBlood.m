% FilterBlood
tic;
h.f1.CurrentAxes = h.ax5;
h.p0status2.String = 'BUSY:Filtering MU_blood...';pause(0.01);
MU_blood2 = Volume_filter(MU_blood,fix(h.p2filter2.Value));
isotemp = isosurface(MU_blood2,1e-5);
if exist('MU_muscle2','var')
    set(h_patch(2),'Faces',isotemp.faces,'Vertices',isotemp.vertices);
else
    set(h_patch(1),'Faces',isotemp.faces,'Vertices',isotemp.vertices);
end
h.p2filter2text.String = ['Blood Filter: ',num2str(fix(h.p2filter2.Value))];
h.p0status2.String = 'DONE:Filtering MU_blood.';pause(0.01);
disp('Filtering MU_blood: Done!');
toc;