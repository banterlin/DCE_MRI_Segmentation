h.p0status2.String = 'BUSY:ROI ref updating!';pause(0.01);
h.f1.CurrentAxes = h.ax3;
if exist('tumour_roi','var')
    tumour_p = tumour_roi.Position;
%     [tumour_mean,tumour_std] = Tissue_analyse_ROIs(tumour_p,fix(h.p2slice1.Value),data4d,1:size(data4d,4));
    [tumour_mean,tumour_std] = Tissue_analyse_ROIs(tumour_p,fix(h.p1slice1.Value),data4d,1:size(data4d,4));
    h.ax3.Children(3).XData = 1:size(data4d,4);
    h.ax3.Children(3).YData = tumour_mean;
    h.ax3.Children(3).Color = [0.2,0.2,1];
    h.p0status2.String = 'Tumour ROI ref updated!';pause(0.01);
else
    h.p0status2.String = 'Tumour ROI is not exist! Click ''Draw Tumour ROI''';pause(0.01);
end
if exist('blood_roi','var')
    blood_p = blood_roi.Position;
%     [blood_mean,blood_std] = Tissue_analyse_ROIs(blood_p,fix(h.p2slice1.Value),data4d,1:size(data4d,4));
    [blood_mean,blood_std] = Tissue_analyse_ROIs(blood_p,fix(h.p1slice1.Value),data4d,1:size(data4d,4));
    h.p0status2.String = h.f1.UserData;
    h.ax3.Children(2).XData = 1:size(data4d,4);
    h.ax3.Children(2).YData = blood_mean;
    h.ax3.Children(2).Color = [1,0.2,0.2];
    h.p0status2.String = 'Blood ROI ref updated!';pause(0.01);
else
    h.p0status2.String = 'Blood ROI is not exist! Click ''Draw Blood ROI''';pause(0.01);
end
legend('Tumour','Blood','Green ROI(Muscle)');pause(0.01);
if exist('new_roi','var')
    new_p = new_roi.Position;
%     [muscle_mean,muscle_std] = Tissue_analyse_ROIs(new_p,fix(h.p2slice1.Value),data4d,1:size(data4d,4));
    [muscle_mean,muscle_std] = Tissue_analyse_ROIs(new_p,fix(h.p1slice1.Value),data4d,1:size(data4d,4));
    h.ax3.Children(1).XData = 1:size(data4d,4);
    h.ax3.Children(1).YData = muscle_mean;
    h.ax3.Children(1).Color = [0.2,1,0.2];
    h.p0status2.String = 'Extra ROI ref updated!';pause(0.01);
else
%     h.p0status2.String = 'Extra ROI is not exist! Click ''Draw Extra ROI''';
    legend('Tumour','Blood');pause(0.01);
end
h.p0status2.String = 'DONE:ROI ref updated!';pause(0.01);