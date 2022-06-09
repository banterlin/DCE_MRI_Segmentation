% Draw_Extra_ROI
h.f1.UserData = h.p0status2.String;
h.p0status2.String = 'Draw Extra ROI, click on the first point to finish';
try 
    delete(new_roi)
    clear new_roi;
catch
end
h.f1.CurrentAxes = h.ax2;
new_roi = drawpolygon('Color','g'); 
new_p = new_roi.Position;
h.p0status2.String = 'BUSY:Analysing Extra ROI.';
% [muscle_mean,muscle_std] = Tissue_analyse_ROIs(new_p,fix(h.p2slice1.Value),data4d,1:size(data4d,4));
[muscle_mean,muscle_std] = Tissue_analyse_ROIs(new_p,fix(h.p1slice1.Value),data4d,1:size(data4d,4));
h.p0status2.String = h.f1.UserData;
h.ax3.Children(1).XData = 1:size(data4d,4);  
h.ax3.Children(1).YData = muscle_mean;
h.ax3.Children(1).Color = [0.2,1,0.2];
h.f1.CurrentAxes = h.ax3;
legend('Tumour','Blood','Extra Tissue');
h.f1.CurrentAxes = h.ax2;
h.p0status2.String = 'DONE:Analysing Extra ROIs.';