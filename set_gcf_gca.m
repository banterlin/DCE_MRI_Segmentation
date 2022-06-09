% Universal File type
myfig = gcf            %Give myfig to current handle
myfig.Position = [100,100,800,600]; %%%%Size figure size w800£¬h600
myaxes = gca           %Give myaxes to current handle
myaxes.FontSize = 14;
myaxes.XLabel.FontSize = 18;
myaxes.YLabel.FontSize = 18;
myaxes.Legend.FontSize = 16;
h.line = findobj(gca,'type','line');
for n = 1:length(hline)
h.line(n).LineWidth = 4;     %%%%%%%LineWidth for every line
end
pause(0.01);saveas(gcf,['save_',datestr(now,'yyyymmdd_HHMMSS'),'.png']);pause(0.01);

