% Draw_Blood_ROI
h.f1.UserData = h.p0status2.String;
h.p0status2.String = 'Draw Blood ROI, click on the first point to finish';
try 
    delete(blood_roi)
    clear blood_roi;
catch
end
h.f1.CurrentAxes = h.ax2;
blood_roi = drawpolygon('Color','r');
blood_p = blood_roi.Position;
h.p0status2.String = 'BUSY:Analysing Blood ROIs.';
% [blood_mean,blood_std] = Tissue_analyse_ROIs(blood_p,fix(h.p2slice1.Value),data4d,1:size(data4d,4));
[blood_mean,blood_std] = Tissue_analyse_ROIs(blood_p,fix(h.p1slice1.Value),data4d,1:size(data4d,4));
h.p0status2.String = h.f1.UserData;
h.ax3.Children(2).XData = 1:size(data4d,4);  
h.ax3.Children(2).YData = blood_mean;
h.ax3.Children(2).Color = [1,0.2,0.2];
h.p0status2.String = 'DONE:Analysing Blood ROIs.';

