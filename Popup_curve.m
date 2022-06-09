h.p0status2.String = 'BUSY:Pop ref curve';pause(0.01);
try
    set(h.f2, 'WindowState', 'maximized');
catch
    h.f2 = figure;
end
groot.CurrentFigure = h.f2;
try
    set(h.f2, 'WindowState', 'maximized');
catch
    % for earlier version
    set(h.f2,'Position',get(0,'Screensize'));
end
h.f2_ax1 = gca;
hold on;plot(1);plot(2);plot(3);
% h.f2_ax1.Children(1) = h.ax3.Children(1);
for n = 1:3
    h.f2_ax1.Children(n).XData = h.ax3.Children(n).XData;
    h.f2_ax1.Children(n).YData = h.ax3.Children(n).YData;
    h.f2_ax1.Children(n).Color = h.ax3.Children(n).Color;
end
if exist('muscle_mean','var')
    h.f2_legend = legend('Tumour','Blood','Extra Tissue');
else
    h.f2_legend = legend('Tumour','Blood');
end
h.f2_legend.Location = 'northwest';
xlabel('Time Interval');
ylabel('Mean Intensity');
title('Reference Mean Time curve from ROI drawn');
h.p0status2.String = 'DONE:Pop ref curve';pause(0.01);