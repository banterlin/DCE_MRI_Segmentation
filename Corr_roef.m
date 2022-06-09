function corr3D = Corr_roef(data4d,d4_mean,corr_threshold)
% step1£º 1D time data
D4_mean(1,1,1,:) = d4_mean;
x = size(data4d,1);
y = size(data4d,2);
z = size(data4d,3);
t = size(data4d,4);
% convert the data dimension
% B = repmat(A,r1,...,rN) specifies a list of scalars, 
% r1,..,rN, that describes how copies of A are arranged in each dimension. 
% When A has N dimensions, the size of B is size(A).*[r1...rN]. 
% For example, repmat([1 2; 3 4],2,3) returns a 4-by-6 matrix.
refCurve4d = repmat(D4_mean,x,y,z);
% step3: Using reference and our data to calculate corrleation,
%           Reference to Matlab corrcoef function ¦Ñ(A,B)
%           Note, here N-1 on the denominator is used since we are not using the whole population as reference.
corrtemp = (data4d-repmat(mean(data4d,4),[1,1,1,t])).*(refCurve4d-repmat(mean(refCurve4d,4),[1,1,1,t]));
corr3D = sum(corrtemp,4)/(size(data4d,4)-1)./std(data4d,0,4)./std(refCurve4d,0,4);
% step4: Filter out pixels that are below threshold value required.
corr3D(corr3D<corr_threshold) = 0;
end