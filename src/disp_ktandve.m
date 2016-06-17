% This demo displays the Kt map and ve map
% Dong Wang 
% 01/30/2016
function disp_ktandve()
    clear;

    load ../out/dce_ori_out.mat;
    kt_ori = Kt;
    ve_ori = ve;
    load ../out/dce_Zero-filled_out.mat;
    kt_zerofill = Kt;
    ve_zerofill = ve;
    load ../out/dce_FT_out.mat;
    kt_fft = Kt;
    ve_fft = ve;
    load ../out/dce_WT_out.mat;
    kt_wt = Kt;
    ve_wt = ve;
    load ../out/dce_TV_out.mat;
    kt_tv = Kt;
    ve_tv = ve;
    load ../out/dce_TGV_out.mat;
    kt_tgv = Kt;
    ve_tgv = ve;
    load ../out/dce_NN_out.mat;
    kt_lr = Kt;
    ve_lr = ve;

    
    width = 50;
    x = 71;
    y = 71;

    kt_ori_crop = kt_ori(x:x+width-1,y:y+width-1);
    kt_zerofill_crop = kt_zerofill(x:x+width-1,y:y+width-1);
    kt_fft_crop = kt_fft(x:x+width-1,y:y+width-1);
    kt_wt_crop = kt_wt(x:x+width-1,y:y+width-1);
    kt_tv_crop = kt_tv(x:x+width-1,y:y+width-1);
    kt_tgv_crop = kt_tgv(x:x+width-1,y:y+width-1);
    kt_lr_crop = kt_lr(x:x+width-1,y:y+width-1);
    
    ve_ori_crop = ve_ori(x:x+width-1,y:y+width-1);
    ve_zerofill_crop = ve_zerofill(x:x+width-1,y:y+width-1);
    ve_fft_crop = ve_fft(x:x+width-1,y:y+width-1);
    ve_wt_crop = ve_wt(x:x+width-1,y:y+width-1);
    ve_tv_crop = ve_tv(x:x+width-1,y:y+width-1);
    ve_tgv_crop = ve_tgv(x:x+width-1,y:y+width-1);
    ve_lr_crop = ve_lr(x:x+width-1,y:y+width-1);

    f = figure('Visible','off');
    
    imshow([...
     [kt_ori_crop;ones(1,width);ve_ori_crop],ones(2*width+1,1),...
     [kt_zerofill_crop;ones(1,width);ve_zerofill_crop],ones(2*width+1,1),...
     [kt_fft_crop;ones(1,width);ve_fft_crop],ones(2*width+1,1),...
     [kt_wt_crop;ones(1,width);ve_wt_crop],ones(2*width+1,1),...
     [kt_tv_crop;ones(1,width);ve_tv_crop],ones(2*width+1,1),...
     [kt_tgv_crop;ones(1,width);ve_tgv_crop],ones(2*width+1,1),...
     [kt_lr_crop;ones(1,width);ve_lr_crop]...
     ]);
    set(gca,'xtick',width/2:width+1:900);
    set(gca,'xticklabel',{'Fully Sampled','Zero Filled','FT','WT','TV',...
    'TGV','NN'},'fontsize',10);
    set(gca,'ytick',[width/2,3*width/2]);
    set(gca,'yticklabel',{'K^{trans}','v_e'},'fontsize',10);
    axis on
    colormap('parula');
    
    print -depsc2 ../ms/figure3.eps;
    close(f);
end