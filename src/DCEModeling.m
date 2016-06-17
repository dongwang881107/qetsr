function output = DCEModeling(img_recon,scale,mode)
% This function computes the CCC and bias of Ktrans and ve 
% Dong Wang 
% 12/05/2015

    %% Save the recontruction image into a mat file
    [m,n,d] = size(img_recon);
    DCEdata = zeros(m,m,d);
    DCEdata(:,1:n,:) = abs(img_recon)*scale;
    DCEdata = shiftdim(DCEdata,2);
    load ../data/dce_params.mat;
    outfile = ['../out/dce_',mode,'_out.mat'];
    name = ['../out/dce_',mode,'.mat'];
    save (name,'SERcutoff','t','Cp','T1data','TR','DCEflip','T1flip','DCEdata','outfile');
    save ('../out/dce_recon.mat','SERcutoff','t','Cp','T1data','TR','DCEflip','T1flip','DCEdata','outfile');
    
    %% Run the Julia DCE Modeling code
    julia('dcerun.jl')
    clear ../out/dce_recon.mat;
    
    %% Compute CCC and Bias
    load (['../out/dce_',mode,'_out','.mat']);
    Kt_cs = Kt; clear Kt;
    ve_cs = ve; clear ve;
    mask_cs = mask; clear mask;
    
    load ../out/dce_ori_out.mat;
    newmask = and(mask,mask_cs);
    
    Kt_ori = Kt(newmask);
    Kt_est = Kt_cs(newmask);
    ve_ori = ve(newmask);
    ve_est = ve_cs(newmask);
    a = isnan(ve_est);
    ve_est(a) = 0;

    cccKt = ccc(Kt_ori,Kt_est);
    cccve = ccc(ve_ori,ve_est);
    
    %% Compute the meanKt and meanve in the tumor area
    load ../data/mask_tumor.mat
    mask_roi = and(mask_cs,mask_tumor);
    
    tumorKt = mean(Kt_cs(mask_roi));
    tumorve = mean(ve_cs(mask_roi));
    
    %% Save the results
    output.cccKt = cccKt;
    output.cccve = cccve;
    output.tumorKt = tumorKt;
    output.tumorve = tumorve;
    
end