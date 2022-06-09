% Draw_Tumour_ROI
h.f1.UserData = h.p0status2.String;
h.p0status2.String = 'Draw Tissue ROI, click first point to finish';
try 
    delete(tumour_roi)
    clear tumour_roi;
catch
end
h.f1.CurrentAxes = h.ax2;
tumour_roi = drawpolygon('FaceAlpha',0);
tumour_p = tumour_roi.Position;
h.p0status2.String = 'BUSY:Analysing Tumour ROIs.';
% [tumour_mean,tumour_std] = Tissue_analyse_ROIs(tumour_p,fix(h.p2slice1.Value),data4d,1:size(data4d,4));
[tumour_mean,tumour_std] = Tissue_analyse_ROIs(tumour_p,fix(h.p1slice1.Value),data4d,1:size(data4d,4));
h.p0status2.String = h.f1.UserData;
h.ax3.Children(3).XData = 1:size(data4d,4);  
h.ax3.Children(3).YData = tumour_mean;
h.ax3.Children(3).Color = [0.2,0.2,1];
h.p0status2.String = 'DONE:Analysing Tumour ROIs.';