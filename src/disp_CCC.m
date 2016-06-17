function disp_CCC()

    f = figure('Visible','off');
    scrsz = get(0,'ScreenSize');

    subplot(6,2,1);plotCCC('../out/dce_Zero-filled_out.mat','Zero Filled','CCC\{K^{trans}\}');
    subplot(6,2,2);plotCCC('../out/dce_Zero-filled_out.mat','Zero Filled','CCC\{v_e\}');
    subplot(6,2,3);plotCCC('../out/dce_WT_out.mat','WT','CCC\{K^{trans}\}');
    subplot(6,2,4);plotCCC('../out/dce_WT_out.mat','WT','CCC\{v_e\}');
    subplot(6,2,5);plotCCC('../out/dce_FT_out.mat','FT','CCC\{K^{trans}\}');
    subplot(6,2,6);plotCCC('../out/dce_FT_out.mat','FT','CCC\{v_e\}');
    subplot(6,2,7);plotCCC('../out/dce_TV_out.mat','TV','CCC\{K^{trans}\}');
    subplot(6,2,8);plotCCC('../out/dce_TV_out.mat','TV','CCC\{v_e\}');
    subplot(6,2,9);plotCCC('../out/dce_TGV_out.mat','TGV','CCC\{K^{trans}\}');
    subplot(6,2,10);plotCCC('../out/dce_TGV_out.mat','TGV','CCC\{v_e\}');
    subplot(6,2,11);plotCCC('../out/dce_NN_out.mat','NN','CCC\{K^{trans}\}');
    subplot(6,2,12);plotCCC('../out/dce_NN_out.mat','NN','CCC\{v_e\}');

    set(gcf,'Position',[scrsz(1),scrsz(2),scrsz(3)/3,scrsz(4)]);
    set(gcf,'PaperPositionMode','auto');
    saveas(gcf,'../ms/figure4.eps','psc2');
%     print -depsc2 ../ms/figure5.eps;
    close(f);
end