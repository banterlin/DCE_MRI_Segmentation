% Corroef_Seg
% % tic
% %     kk = 0;
% %     for k = 1:size(data4d,3)
% %         for m = 1:size(data4d,1)
% %             for n = 1:size(data4d,2)
% %                 temp = squeeze(data4d(m,n,k,t1));
% %                 corr = zeros(2,2,length(refCurve));
% %                 for N = 1:size(refCurve,2)
% %                     corr(:,:,N) = corrcoef(refCurve(N).pre,temp);
% %                 end
% %                 try
% %                     if max(corr(1,2,:)) > corr_threshold
% %                         MU(m,n,k) = find(corr(1,2,:)==max(corr(1,2,:)));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Old method here is very inefficent, as the
%%%%%%%%%%%%%%%%%%%%%%%%%%%% code below does rarely get excuted
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %                         if MU(m,n,k) == 1
% %                             kk = kk + 1;
% %                             A = polyfit([6:10],transpose(temp(6:10)),1);
% %                             A = A(1);
% %                             if  A < B || A > C
% %                                 MU(m,n,k) = 0;
% %                             end
% %                         end
% %                     end
% %                 catch
% %                     MU(m,n,k) = 0;   % intensity = 0 on the original image since corr=0.
% %                 end
% %             end
% %         end
% %         disp([sprintf('Process: %3.1f',(k/size(data4d,3)*100)),'%']);
% %     end
% %     kk
% %     toc
% %     disp('Corrcoef Process end.');

%%%% Under the heavy cost of RAM, matrix calculation is much faster than loops
% tic;
% A = randi([0,255],320,320,24,35);
% B = repmat((A(1,1,1,:)),320,320,24);
% corr = (A-repmat(mean(A,4),[1,1,1,35])).*(B-repmat(mean(B,4),[1,1,1,35]));
% corr3D = sum(corr,4)/(numel(A)-1)./std(A,0,4)./std(B,0,4);
% toc;
try
    corr_threshold = str2double(h.p2edit10.String);
    tic;
    h.p0status2.String = 'BUSY:Segmenting Tumour...';pause(0.01);
    tumour_corr3D = Corr_roef(data4d,tumour_mean,corr_threshold);
    % Tumour_mean(1,1,1,:) = tumour_mean;
    % refCurve4d = repmat(   Tumour_mean         ,[320,320,24,1]);
    % corr = (data4d-repmat(mean(data4d,4),[1,1,1,35])).*(refCurve4d-repmat(mean(refCurve4d,4),[1,1,1,35]));
    % tumour_corr3D = sum(corr,4)/(size(data4d,4))./std(data4d,0,4)./std(refCurve4d,0,4);
    % tumour_corr3D(tumour_corr3D<corr_threshold) = 0;
    disp('Corroef Tumour Seg: Done!');
    toc;
    
    tic;
    h.p0status2.String = 'BUSY:Segmenting Blood...';pause(0.01);
    blood_corr3D = Corr_roef(data4d,blood_mean,corr_threshold);
    % Blood_mean(1,1,1,:) = blood_mean;
    % refCurve4d = repmat(   Blood_mean          ,320,320,24);
    % corr = (data4d-repmat(mean(data4d,4),[1,1,1,35])).*(refCurve4d-repmat(mean(refCurve4d,4),[1,1,1,35]));
    % blood_corr3D = sum(corr,4)/(size(data4d,4))./std(data4d,0,4)./std(refCurve4d,0,4);
    % blood_corr3D(blood_corr3D<corr_threshold) = 0;
    disp('Corroef Blood Seg: Done!');
    toc;
    
    if exist('muscle_mean','var')
        tic;
        h.p0status2.String = 'BUSY:Segmenting Extra Tissue...';pause(0.01);
        extra_corr3D = Corr_roef(data4d,muscle_mean,corr_threshold);
        %     Muscle_mean(1,1,1,:) = muscle_mean;
        %     refCurve4d = repmat(   Muscle_mean         ,320,320,24);
        %     corr = (data4d-repmat(mean(data4d,4),[1,1,1,35])).*(refCurve4d-repmat(mean(refCurve4d,4),[1,1,1,35]));
        %     extra_corr3D = sum(corr,4)/(size(data4d,4))./std(data4d,0,4)./std(refCurve4d,0,4);
        %     extra_corr3D(extra_corr3D<corr_threshold) = 0;
        disp('Corroef Extra Seg: Done!');
        toc;
    end
    
    tic;
    h.p0status2.String = 'BUSY:Finishing segmentation....';pause(0.01);
    if exist('muscle_mean','var')
        MU_tumour = (tumour_corr3D>blood_corr3D)&(tumour_corr3D>extra_corr3D);
        MU_blood = (blood_corr3D>tumour_corr3D)&(blood_corr3D>extra_corr3D);
        MU_muscle = (extra_corr3D>tumour_corr3D)&(extra_corr3D>blood_corr3D);
        % set tumour 1, blood 2, extra 3
        MU = MU_tumour + MU_blood*2 + MU_muscle*3;
    else
        MU_tumour = (tumour_corr3D>blood_corr3D);
        MU_blood = (blood_corr3D>tumour_corr3D);
        MU = MU_tumour + MU_blood*2;
    end
    h.p0status2.String = 'DONE:Segmentation Complete.';pause(0.01);
    disp('Corroef work: Done!');
    toc;
catch
    h.p0status2.String = 'ERROR:Corroef threshold must be numeric.';pause(0.01);
end