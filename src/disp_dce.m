% This demo displays dce data in a row as well as the difference image
% Dong Wang
% 12/29/2015
function disp_dce(i)
    % Load mat files
    load ../out/dce_ori.mat;
    img_ori = shiftdim(DCEdata,1);
    img_ori = img_ori(:,1:128,:);
    scale = max(img_ori(:));
    img_ori = img_ori/scale;
    load ../out/dce_ZeroFilled.mat;
    zerofill = shiftdim(DCEdata,1);
    zerofill = zerofill(:,1:128,:)/scale;
    load ../out/dce_FT.mat;
    img_recon_fft = shiftdim(DCEdata,1);
    img_recon_fft = img_recon_fft(:,1:128,:)/scale;
    load ../out/dce_WT.mat;
    img_recon_wt = shiftdim(DCEdata,1);
    img_recon_wt = img_recon_wt(:,1:128,:)/scale;
    load ../out/dce_TV.mat;
    img_recon_tv = shiftdim(DCEdata,1);
    img_recon_tv = img_recon_tv(:,1:128,:)/scale;
    load ../out/dce_TGV.mat;
    img_recon_tgv = shiftdim(DCEdata,1);
    img_recon_tgv = img_recon_tgv(:,1:128,:)/scale;
    load ../out/dce_NN.mat;
    img_recon_lr = shiftdim(DCEdata,1);
    img_recon_lr = img_recon_lr(:,1:128,:)/scale;

    %% Choose the dynamic
    [m,n,~] = size(img_ori);
    times = 10;
    fs = 8;
    %% Temporal regularizers
    
    imshow([...
         [abs(img_ori(:,:,i));ones(1,n);abs(img_ori(:,:,i)-img_ori(:,:,i))*times],ones(2*m+1,1),...
         [abs(zerofill(:,:,i));ones(1,n);abs(img_ori(:,:,i)-abs(zerofill(:,:,i)))*times],ones(2*m+1,1),...
         [abs(img_recon_fft(:,:,i));ones(1,n);abs(img_ori(:,:,i)-abs(img_recon_fft(:,:,i)))*times],ones(2*m+1,1),...
         [abs(img_recon_wt(:,:,i));ones(1,n);abs(img_ori(:,:,i)-abs(img_recon_wt(:,:,i)))*times],ones(2*m+1,1),...
         [abs(img_recon_tv(:,:,i));ones(1,n);abs(img_ori(:,:,i)-abs(img_recon_tv(:,:,i)))*times],ones(2*m+1,1),...
         [abs(img_recon_tgv(:,:,i));ones(1,n);abs(img_ori(:,:,i)-abs(img_recon_tgv(:,:,i)))*times],ones(2*m+1,1),...
         [abs(img_recon_lr(:,:,i));ones(1,n);abs(img_ori(:,:,i)-abs(img_recon_lr(:,:,i)))*times]...
         ]);

    set(gca,'xtick',64:128:900);
    set(gca,'xticklabel',{'Fully Sampled','Zero Filled','FT','WT','TV','TGV','NN'},'fontsize',fs);
    set(gca,'ytick',[96,288]);
    set(gca,'yticklabel',{'DCE','Diff\times10'},'fontsize',fs);
    set(gca,'fontsize',fs);
    axis on;
    
end