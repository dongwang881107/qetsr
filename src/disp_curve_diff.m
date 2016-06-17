% This m-file shows the intensity curve difference with respect to the
% original image in the tumor area
% 02/26/2016
% Dong Wang
function disp_curve_diff()

    load ../out/dce_ori.mat;
    img_ori = shiftdim(DCEdata,1);
    load ../out/dce_ZeroFilled.mat;
    img_zerofill = shiftdim(DCEdata,1);
    load ../out/dce_WT.mat;
    img_wt = shiftdim(DCEdata,1);
    load ../out/dce_FT.mat;
    img_fft = shiftdim(DCEdata,1);
    load ../out/dce_TV.mat;
    img_tv = shiftdim(DCEdata,1);
    load ../out/dce_TGV.mat;
    img_tgv = shiftdim(DCEdata,1);
    load ../out/dce_NN.mat;
    img_lr = shiftdim(DCEdata,1);

    % compute average intensity in tumor area
 
    load ../data/mask_tumor.mat;
    
    mask = repmat(mask_tumor,[1,1,size(img_ori,3)]);
    tumor_pixel_num = length(find(mask_tumor==1));
    [m,n,d] = size(img_ori);
    
    img_tumor_ori = sum(reshape(img_ori.*mask,m*n,d))/tumor_pixel_num;
    img_tumor_zerofill = sum(reshape(img_zerofill.*mask,m*n,d))/tumor_pixel_num;
    img_tumor_wt = sum(reshape(img_wt.*mask,m*n,d))/tumor_pixel_num;
    img_tumor_fft = sum(reshape(img_fft.*mask,m*n,d))/tumor_pixel_num;
    img_tumor_tv = sum(reshape(img_tv.*mask,m*n,d))/tumor_pixel_num;
    img_tumor_tgv = sum(reshape(img_tgv.*mask,m*n,d))/tumor_pixel_num;
    img_tumor_lr = sum(reshape(img_lr.*mask,m*n,d))/tumor_pixel_num;

    % Display the intensity curve at single pixel
    m = 96;
    n = 96;

    plot_ori = reshape(img_ori(m,n,:),d,1);
    plot_zerofill = reshape(img_zerofill(m,n,:),d,1);
    plot_wt = reshape(img_wt(m,n,:),d,1);
    plot_fft = reshape(img_fft(m,n,:),d,1);
    plot_tv = reshape(img_tv(m,n,:),d,1);
    plot_tgv = reshape(img_tgv(m,n,:),d,1);
    plot_lr = reshape(img_lr(m,n,:),d,1);
    
    % Show the figures
    
    f = figure('Visible','off');
    scrsz = get(0,'ScreenSize');
    set(gcf,'Position',[scrsz(1),scrsz(2),2*scrsz(3)/3,scrsz(4)]);
    set(gcf,'PaperPositionMode','auto');
    fs = 25;
    
    subplot(211);
    plot(img_tumor_ori-img_tumor_ori,'k','LineWidth',2);hold on;
    plot(img_tumor_zerofill-img_tumor_ori,'r','LineWidth',2);hold on;
    plot(img_tumor_wt-img_tumor_ori,'Color',[0.5,0.5,0.5],'LineWidth',2);hold on;
    plot(img_tumor_fft-img_tumor_ori,'b','LineWidth',2);hold on;
    plot(img_tumor_tv-img_tumor_ori,'g','LineWidth',2);hold on;
    plot(img_tumor_tgv-img_tumor_ori,'m','LineWidth',2);hold on;
    plot(img_tumor_lr-img_tumor_ori,'c','LineWidth',2);
    
    h1 = legend({'Fully Sampled','Zero Filled','WT','FT','TV','TGV','NN'});
    set(h1,'fontsize',2*fs/3);
    set(gca,'fontsize',fs);
    h1.Box = 'off';
    xlabel('Frame number','fontsize',fs);
    ylabel('Signal Diff','fontsize',fs);
    title('(a)','fontsize',fs);
   
    subplot(212);
    plot(plot_ori-plot_ori,'k','LineWidth',2);hold on;
    plot(plot_zerofill-plot_ori,'r','LineWidth',2);hold on;
    plot(plot_wt-plot_ori,'Color',[0.5,0.5,0.5],'LineWidth',2);hold on;
    plot(plot_fft-plot_ori,'b','LineWidth',2);hold on;
    plot(plot_tv-plot_ori,'g','LineWidth',2);hold on;
    plot(plot_tgv-plot_ori,'m','LineWidth',2);hold on;
    plot(plot_lr-plot_ori,'c','LineWidth',2);
    
    h2 = legend({'Fully Sampled','Zero Filled','WT','FT','TV','TGV','NN'});
    set(h2,'fontsize',2*fs/3);
    set(gca,'fontsize',fs);
    h2.Box = 'off';
    xlabel('Frame Number','fontsize',fs);
    ylabel('Signal Diff','fontsize',fs);
    title('(b)','fontsize',fs);
    
    print -depsc2 ../ms/figure6.eps;
    close(f);
    
end
