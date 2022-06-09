% Popup_curve
h.p0status2.String = 'BUSY:Popup 3D...';pause(0.01);
idx = find(MU_tumour2>0);
filtered_tumour_mean = zeros(1,size(data4d,4));
for n = 1:size(data4d,4)
    temp = squeeze(data4d(:,:,:,n));
    filtered_tumour_mean(n) = mean(temp(idx));
end
try
    set(h.f3, 'WindowState', 'maximized');
catch
    h.f3 = figure;
end
groot.CurrentFigure = h.f3;
try
    set(h.f3, 'WindowState', 'maximized');
catch
    % for earlier version
    set(h.f3,'Position',get(0,'Screensize'));
end

h.f3_ax1 = gca;
hold on;
plot(tumour_mean,'-ok','linewidth',2);
plot(filtered_tumour_mean,'-or','linewidth',2);
legend({'Drawn tumour ROI','Segmented Tumour'},'Location','northeast');
xlabel('Time Serial');
ylabel('Pixel mean Intensity');
title('Effect of segmentation on mean intensity');

try
    set(h.f4, 'WindowState', 'maximized');
catch
    h.f4 = figure;
end
groot.CurrentFigure = h.f4;
try
    set(h.f4, 'WindowState', 'maximized');
catch
    % for earlier version
    set(h.f4,'Position',get(0,'Screensize'));
end

h.f4_ax1 = gca;
hold on;
for n = 1:3
    isosurface(zeros(3,3,3),1e-5);
end

xlim([0,320]);
ylim([0,320]);
zlim([0,24]);
h_patch2 = findobj(gca,'type','Patch');
if exist('MU_muscle2','var')&&h.p2checkbox.Value
    set(h_patch2(3),'Facecolor',[0,0,0]);       % Tumour
    set(h_patch2(2),'Facecolor',[1,0,0]);       % Blood
    set(h_patch2(1),'Facecolor',[0,1,0]);       % Muscle
    set(h_patch2,'FaceAlpha',0.3);
    %%%%%%%%%%%%%%%%%%%%£¬h_patch2(3)~(1) represent Tumour£¬Blood£¬Muscle
    set(h_patch2(3),'Faces',h_patch(3).Faces,'Vertices',h_patch(3).Vertices);
    set(h_patch2(2),'Faces',h_patch(2).Faces,'Vertices',h_patch(2).Vertices);
    set(h_patch2(1),'Faces',h_patch(1).Faces,'Vertices',h_patch(1).Vertices);
else
    set(h_patch2(2),'Facecolor',[0,0,0]);       % Tumour
    set(h_patch2(1),'Facecolor',[1,0,0]);       % Blood
    set(h_patch2,'FaceAlpha',0.3);
    %%%%%%%%%%%%%%%%%%%%h_patch2(2)~(1)represent Tumour£¬Blood
    set(h_patch2(2),'Faces',h_patch(2).Faces,'Vertices',h_patch(2).Vertices);
    set(h_patch2(1),'Faces',h_patch(1).Faces,'Vertices',h_patch(1).Vertices);
end

cameratoolbar(h.f4,'Show');
cameratoolbar(h.f4,'SetMode','Orbit');
axis off;
%%%%%%%%%%%%%%%%%%%% Volume compute Begin %%%%%%%%%%%%%%%
V_tumour = sum(MU_tumour2>0,'all')*Volume_ratio;
V_blood = sum(MU_blood2>0,'all')*Volume_ratio;
if exist('MU_muscle2','var')&&h.p2checkbox.Value
    V_muscle = sum(MU_muscle2>0,'all')*Volume_ratio;
    Volume_info = [...
        'V_tumour: ',sprintf('%0.1f',V_tumour),'mm3. ',...
        'V_blood: ',sprintf('%0.1f',V_blood),'mm3. ',...
        'V_muscle: ',sprintf('%0.1f',V_muscle),'mm3. '];
else
    Volume_info = [...
        'V_tumour: ',sprintf('%0.1f',V_tumour),'mm3. ',...
        'V_blood: ',sprintf('%0.1f',V_blood),'mm3. '];
end
msgbox(Volume_info);            %%%Report volume to user
h.f4.Name = Volume_info;        %%%figure Name
disp(Volume_info);              %%%Matlab command window display
%%%%%%%%%%%%%%%%%%%% Volume compute END %%%%%%%%%%%%%%%
h.p0status2.String = 'DONE:Popup 3D...';pause(0.01);