function [tissue_mean,tissue_std] = Tissue_analyse_ROIs(tissue_p,Slice,data4d,t_span)
% function [tissue_mean,tissue_std] = tissue_analyseROIs(tissue_p,Slice,data4d)
Tissue_mask = poly2mask(tissue_p(:,1), tissue_p(:,2), size(data4d,1), size(data4d,2));
Tissue_mask = repmat(Tissue_mask,[1,1,1,size(data4d,4)]).*data4d(:,:,Slice,:);
Tissue_mask(Tissue_mask==0)=nan;
tissue_mean = squeeze(nanmean(Tissue_mask,[1,2]))';
tissue_std = squeeze(nanstd(Tissue_mask,0,[1,2]))';
end