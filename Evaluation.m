%%
SL=13;
f99 = figure(99); set(f99,'Color','w');
for i = 3:10
    f99 = imagesc(data4d(:,:,SL,i)); axis image; axis off; colormap gray % colormap jet
    title(['Time interval = ',num2str(i)]);
    pause(0.5);
end
    % ha = fmatch_fsingle(ha,data4d,myroi, SL, 10);
%% MU display 
figure;
MU_FILTER = (MU_tumour2>0)+(MU_blood2>0)*2;
image = imagesc(MU_FILTER(:,:,SL)); axis image; axis off;  colormap jet
title('C. Segmentation containing tumour and blood')

%% Pre Filter
figure;
MU1 = MU_tumour(:,:,:);
MU1 (MU1>0) = 1;
image = imagesc(MU1(:,:,SL)); axis image; axis off;  colormap gray
title('A. UnFiltered algorithm Segmentation')
% Post Filter
figure;
MU2 = MU_tumour2(:,:,:);
MU2 (MU2>0) = 1;
image = imagesc(MU2(:,:,SL)); axis image; axis off;  colormap gray
title('B. Filtered algorithm Segmentation')

%% Algorithm segmentation
figure;
ha = imagesc(MU2(:,:,SL)); axis image; axis off;
ha = fmatch_fsingle2(ha,MU2,myroi, SL, 10);
% title('radiologist drawing placed on segmentation')
 title('ws-20')

%% Radiologist Segmentation
m =3
figure;
MA = Evalu(data4d,myroi, SL,m);

%% DICE
MU3 = MU1(:,:,SL);
TP = length (MA(MA==1 & MU3 ==1));
FP = length (MA(MA==0 & MU3 ==1));
TN = length (MA(MA==0 & MU3 ==0));
FN = length (MA(MA==1 & MU3 ==0));

DPricision_1 = TP/(TP+FP);
DRecall_1 = TP/(TP+FN);
DSD_1 = dice(MA,logical(MU3));

MU4 = MU2(:,:,SL);
TP2 = length (MA(MA==1 & MU4 ==1));
FP2 = length (MA(MA==0 & MU4 ==1));
TN2 = length (MA(MA==0 & MU4 ==0));
FN2 = length (MA(MA==1 & MU4 ==0));

DPricision_2 = TP2/(TP2+FP2);
DRecall_2 = TP2/(TP2+FN2);
DSD_2 = dice(MA,logical(MU4));


