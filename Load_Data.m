% Load_Data
[file,path] = uigetfile('.mat','Loading DCE Data Set');
if path==0
    h.p0status2.String = 'User Canceled! Press Load data again?';
    h.p1slice1.Min = 0;
    h.p1slice1.Max = 1;
    h.p1slice1.SliderStep = [0.2,0.2];
    h.p1slice1.Value = 1;
    
    h.p1time1.Min = 0;
    h.p1time1.Max = 1;
    h.p1time1.SliderStep = [0.2,0.2];
    h.p1time1.Value = 1;
    
%     h.p2slice1.Min = 0;
%     h.p2slice1.Max = 1;
%     h.p2slice1.SliderStep = [0.2,0.2];
%     h.p2slice1.Value = 1;
    
    h.p2time1.Min = 0;
    h.p2time1.Max = 1;
    h.p2time1.SliderStep = [0.2,0.2];
    h.p2time1.Value = 1;
    
    h.p1text1.String = 'Slice: ?';
    h.p1text2.String = 'Time: ?';
    h.p2text1.String = 'Slice: ?';
    h.p2text2.String = 'Time: ?';
    
    h.p2slice3.Min = 0;
    h.p2slice3.Max = 1;
    h.p2slice3.SliderStep = [0.2,0.2];
    h.p2slice3.Value = 1;
    h.p2slice3.String = 'slice: ?';

else
    h.p0status1.String = ['Current Data: ',fullfile(path,file)];
    h.p0status2.String = 'BUSY:Loading DCE Data Set...';
    pause(0.01);
    load(fullfile(path,file));
        
    h.p1slice1.Min = 1;
    h.p1slice1.Max = size(data4d,3);
    h.p1slice1.SliderStep = [1/h.p1slice1.Max,0.2];
%     h.p1slice1.Value = fix((h.p1slice1.Max/2));
    h.p1slice1.Value = image1_s;
    
    h.p1time1.Min = 1;
    h.p1time1.Max = size(data4d,4);
    h.p1time1.SliderStep = [1/h.p1time1.Max,0.2];
%     h.p1time1.Value = fix((h.p1time1.Max/2));
    h.p1time1.Value = image1_t;
    
%     h.p2slice1.Min = 1;
%     h.p2slice1.Max = size(data4d,3);
%     h.p2slice1.SliderStep = [1/h.p1slice1.Max,0.2];
% %     h.p2slice1.Value = fix((h.p1slice1.Max/2));
%     h.p2slice1.Value = image2_s;
    
    h.p2time1.Min = 1;
    h.p2time1.Max = size(data4d,4);
    h.p2time1.SliderStep = [1/h.p2time1.Max,0.2];
%     h.p2time1.Value = fix((h.p2time1.Max/2));
    h.p2time1.Value = image2_t;
    
    h.f1.CurrentAxes = h.ax1;
    imagesc(data4d(:,:,h.p1slice1.Value,h.p1time1.Value)); axis image; axis off;  colormap gray;
    h.f1.CurrentAxes = h.ax2;
%     imagesc(data4d(:,:,h.p2slice1.Value,h.p2time1.Value)); axis image; axis off;  colormap gray;
    imagesc(data4d(:,:,h.p1slice1.Value,h.p2time1.Value)); axis image; axis off;  colormap gray;
    
    h.p1text1.String = ['Slice: ',num2str(fix(h.p1slice1.Value))];
    h.p1text2.String = ['Time: ', num2str(fix(h.p1time1.Value))];
    h.p2text1.String = ['Slice: ',num2str(fix(h.p2slice1.Value))];
    h.p2text2.String = ['Time: ', num2str(fix(h.p2time1.Value))];
    
    h.p2slice3.Min = 1;
    h.p2slice3.Max = size(data4d,3);
    h.p2slice3.SliderStep = [1/h.p2slice3.Max,0.2];
    h.p2slice3.Value = image1_s;
    h.p2slice3.Callback = 'Single_or_Full_color';
       
    h.p0status2.String = 'DONE:Patient data Retrived!...';
    disp(h.p0status2.String);
end

