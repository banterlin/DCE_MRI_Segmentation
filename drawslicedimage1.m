h.p0status2.String = ['BUSY:Image updating!'];pause(0.01);
if exist('data4d','var')
    %     if exist('MU_singlecolor_after','var')
    %         Single_Color_Mark;
    %     else
    set(gcf,'CurrentAxes',h.ax1_2);
    cla;
    h.ax1_2.Visible = 'off';
    set(gcf,'CurrentAxes',h.ax2_2);
    cla;
    h.ax2_2.Visible = 'off';
    h.ax1.Visible = 'on';
    h.ax2.Visible = 'on';
    pause(0.01);
    set(gcf,'CurrentAxes',h.ax2);
    colormap(repmat(linspace(0,1,256)',[1,3]));               %%%%%colormap gray has bug
    image2 = imagesc(data4d(:,:,fix(h.p1slice1.Value),fix(h.p2time1.Value))); axis image; axis off; 
    set(gcf,'CurrentAxes',h.ax1);
    colormap(repmat(linspace(0,1,256)',[1,3]));               %%%%%colormap gray has bug
    image1 = imagesc(data4d(:,:,fix(h.p1slice1.Value),fix(h.p1time1.Value))); axis image; axis off; 
    h.p1text2.String = ['Time: ',num2str(fix(h.p1time1.Value))];
    %     end
    h.p1text1.String = ['Slice: ',num2str(fix(h.p1slice1.Value))];
    h.p0status2.String = ['DONE:Image updated!'];pause(0.01);
else
    h.p0status2.String = 'WRONG DATA! Press Load data again?';
end