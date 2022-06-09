function MA = Evalu(data4d,myroi, iSL,m)
% m represent slice serial number of radiologist's drawing
% axes(ha);
MU = imagesc(data4d(:,:,iSL,10));axis image; axis off;  colormap gray % colormap jet
radiologist_roi = drawpolygon('Color','r');     %Initialise ROI
polytmp = myroi.ROI(m).poly;    

radiologist_roi.Position = polytmp;
% iSN = 10;

MA = createMask(radiologist_roi);
% close(MU);
figure;Fig = imagesc(MA);axis image; axis off;  colormap gray 
hold on; title(sprintf('B.Radiologist''s ROI converted into binary mask'));
end



