if h.p2checkbox10.Value
    h.p2text3.String = ['Slice: ',num2str(fix(h.p2slice3.Value))];
    h.p0status2.String = 'BUSY:Draw single color MU';pause(0.01);
    h.color_tumour = [0,0,0];
    h.color_blood = [1,0,0];
    h.color_muscle = [0,1,0];
    if ~exist('MU_singlecolor_before','var')
        if exist('MU_muscle2','var')
            % MU2= (MU_tumour2>0)+(MU_blood2>0)*2+(MU_muscle>0)*3;
            MU_singlecolor_before = (MU_tumour>0)+(MU_blood>0)*2+(MU_muscle>0)*3;
            MU_singlecolor_after = (MU_tumour2>0)+(MU_blood2>0)*2+(MU_muscle2>0)*3;
            h.cmap = [1,1,1;h.color_tumour;h.color_blood;h.color_muscle];
        else
            MU_singlecolor_before = (MU_tumour>0)+(MU_blood>0)*2;
            MU_singlecolor_after = (MU_tumour2>0)+(MU_blood2>0)*2;
            h.cmap = [1,1,1;h.color_tumour;h.color_blood];
        end
    end
    h.p0status2.String = 'BUSY:Draw single color MU in left fig';pause(0.01);
    h.f1.CurrentAxes = h.ax1;cla;pause(0.01);
    h.ax1.Visible = 'off';
    h.f1.CurrentAxes = h.ax2;cla;pause(0.01);
    h.ax2.Visible = 'off';
    
    h.ax1_2.Visible = 'on';
    h.ax2_2.Visible = 'on';
    pause(0.01);
    h.f1.CurrentAxes = h.ax1_2;cla;pause(0.01);
    image3 = imagesc(MU_singlecolor_before(:,:,fix(h.p2slice3.Value))); axis image; axis off;
    colormap(h.cmap);
    h.f1.CurrentAxes = h.ax2_2;pause(0.01);
    h.p0status2.String = 'BUSY:Draw single color MU in right fig';pause(0.01);
    image4 = imagesc(MU_singlecolor_after(:,:,fix(h.p2slice3.Value))); axis image; axis off;
    colormap(h.cmap);
    h.p0status2.String = 'DONE:Draw single color MU';pause(0.01);
else
    drawslicedimage1;
    h.f1.CurrentAxes = h.ax2;
    try
        tumour_roi = drawpolygon('Position',tumour_p);
        tumour_p = tumour_roi.Position;
        
        blood_roi = drawpolygon('Position',blood_p);
        blood_p = blood_roi.Position;
        
        if exist('new_roi','var')
            new_roi = drawpolygon('Position',new_p);
            new_p = new_roi.Position;
            h.ax2.Children(3).Color = [0.2,0.2,1];
            h.ax2.Children(2).Color = [1,0.2,0.2];
            h.ax2.Children(1).Color = [0.2,1,0.2];
        else
            h.ax2.Children(2).Color = [0.2,0.2,1];pause(0.01);
            h.ax2.Children(1).Color = [1,0.2,0.2];pause(0.01);
        end
        Update_Ref_of_ROI;
    catch
    end
end