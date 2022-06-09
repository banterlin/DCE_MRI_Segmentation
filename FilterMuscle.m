if exist('MU_muscle','var')
    tic;
    h.f1.CurrentAxes = h.ax5;
    h.p0status2.String = 'BUSY:Filtering MU_Muscle...';pause(0.01);
    MU_muscle2 = Volume_filter(  MU_muscle  ,fix(h.p2filter3.Value));
    isotemp = isosurface(MU_muscle2,1e-5);
    
    set(  h_patch(1)  ,'Faces',isotemp.faces,'Vertices',isotemp.vertices);
    h.p2filter3text.String = ['Muscle Filter: ',num2str(fix(h.p2filter3.Value))];
    h.p0status2.String = 'DONE:Filtering MU_Muscle.';pause(0.01);
    disp('Filtering MU_Muscle: Done!');
    toc;
else
    h.p0status2.String = 'DONE:No Muscle ROI.';pause(0.01);
end