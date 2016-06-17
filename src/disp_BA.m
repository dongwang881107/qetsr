function disp_BA()
% This function displays the Bland Altman plot for Kt and ve
% Dong Wang
% 03/30/2016

    f = figure('Visible','off');
    scrsz = get(0,'ScreenSize');

    subplot(6,2,1);plotBA('../out/dce_ZeroFilled_out.mat','Zero Filled','Kt');
    subplot(6,2,2);plotBA('../out/dce_ZeroFilled_out.mat','Zero Filled','ve');
    subplot(6,2,3);plotBA('../out/dce_FT_out.mat','FT','Kt');
    subplot(6,2,4);plotBA('../out/dce_FT_out.mat','FT','ve');
    subplot(6,2,5);plotBA('../out/dce_WT_out.mat','WT','Kt');
    subplot(6,2,6);plotBA('../out/dce_WT_out.mat','WT','ve');
    subplot(6,2,7);plotBA('../out/dce_TV_out.mat','TV','Kt');
    subplot(6,2,8);plotBA('../out/dce_TV_out.mat','TV','ve');
    subplot(6,2,9);plotBA('../out/dce_TGV_out.mat','TGV','Kt');
    subplot(6,2,10);plotBA('../out/dce_TGV_out.mat','TGV','ve');
    subplot(6,2,11);plotBA('../out/dce_NN_out.mat','NN','Kt');
    subplot(6,2,12);plotBA('../out/dce_NN_out.mat','NN','ve');

    set(gcf,'Position',[scrsz(1),scrsz(2),1*scrsz(3)/2,scrsz(4)]);
    set(gcf,'PaperPositionMode','auto');
%     saveas(gcf,'../ms/figure4.eps','psc2');
    print -depsc2 ../ms/figure5.eps;
    close(f);

end
