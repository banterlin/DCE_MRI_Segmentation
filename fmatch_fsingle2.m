function ha = fmatch_fsingle(ha,data4d,myroi, iSL, iSN, varargin)
% data4d input here need to be a 3D matrix instead of 4D
% ha = fmatch_fsingle(ha,data4d,myroi, iSL, iSN, varargin = iROI)
% v20190113

% axes(ha);

%imagesc(squeeze(data4d(:,:,iSL, iSN)));
imagesc(data4d(:,:,iSL)); % For MU
axis image; axis off; colormap gray


if nargin > 5
    iROI_Tumor = varargin{1};
        if sum(myroi.roiLookup(iSL,iSN,:)) > 0
        for ii = iROI_Tumor
            roino_tmp = myroi.roiLookup(iSL,iSN,ii);
            
            if roino_tmp > 0
                polytmp = myroi.ROI(roino_tmp).poly;
                
                h1=impoly(gca,polytmp);
                setColor(h1,'yellow');
                
                [~,idx] = min(polytmp,[],1);
                idxmax = idx(2);
                
                offs1 = 20;
                offs2 = 0;
                
                hStrings = text(polytmp(idxmax,1)+offs1,polytmp(idxmax,2)+offs2,int2str(ii), ...
                    'FontSize',18,'FontWeight','b','Color','k','BackgroundColor','w','interpreter','none');
            end
            
        end
    end
    
    hold on; title(sprintf('SL = %d, SN = %d',iSL,iSN))
    
else
    
    if sum(myroi.roiLookup(iSL,iSN,:)) > 0
        for ii = 1:size(myroi.roiLookup,3)
            roino_tmp = myroi.roiLookup(iSL,iSN,ii);
            
            if roino_tmp > 0
                polytmp = myroi.ROI(roino_tmp).poly;
                
                h1=impoly(gca,polytmp);
                setColor(h1,'red');
                
                [~,idx] = min(polytmp,[],1);
                idxmax = idx(2);
                
                offs1 = 20;
                offs2 = 0;
            end
            
        end
    end
    
%    hold on; title(sprintf('SL = %d, SN = %d',iSL,iSN))
    hold on; title(sprintf('D.Radiologist''s ROI placed on algorithm segmentation'));
    
end



