function plotBA(name,mode,value)
% This function shows Bland-Altman plot of kt and ve between the original 
% data and the reconstruction data.
% Dong Wang
% 03/30/2016

    load (name);

    if strcmp(value,'Kt')
        Kt_cs = Kt; clear Kt;
        mask_cs = mask; clear mask;
        load ../out/dce_ori_out.mat;
        newmask = and(mask,mask_cs);

        blandaltman(Kt(newmask),Kt_cs(newmask),mode,value);
       
    elseif strcmp(value,'ve')
        ve_cs = ve; clear ve;
        mask_cs = mask; clear mask;
        load ../out/dce_ori_out.mat;
        newmask = and(mask,mask_cs);

        ve_ori = ve(newmask);
        ve_est = ve_cs(newmask);
        ve_est(isnan(ve_est)) = 0;
        
        blandaltman(ve_ori,ve_est,mode,value);
        
    end
    
end
