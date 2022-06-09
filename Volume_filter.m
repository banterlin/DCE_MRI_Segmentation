function L = Volume_filter(data3d,filtersize)
% Step1£ºCompute for connected voxel£¬Define one voxel need to have 6 connected voxels
% Pixels are connected if their faces touch. 
% Two adjoining pixels are part of the same object 
% if they are both on and are connected in:
% One of these directions: in, out, left, right, up, and down
[L, NUM] = bwlabeln(data3d, 6);
% Step2£ºInitialise Connected Element Counter
addsum = zeros(NUM,1);
% Step3£ºLoop
for n = 1:NUM
    % Step4£ºCompute connected voxel volume
    temp = L==n;
    addsum(n) = sum(temp(:));
end
% Step5  Find volumes that are smaller than the defined parameter threshold.
idx = find(addsum<filtersize);
for n = 1:length(idx)
    % Step6£ºFiltering dataset
    L(L==idx(n)) = 0;
end
end