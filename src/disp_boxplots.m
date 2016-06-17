% This function saves the histograms in the paper
% Dong Wang
% 03/08/2016

function disp_boxplots(Mode,pick,name)
    
    load(name,'ser','cccKt','cccve','tumorKt','tumorve');
    
    ser_pick = ser(:,pick);
    cccKt_pick = cccKt(:,pick);
    cccve_pick = cccve(:,pick);
    tumorKt_pick = tumorKt(:,pick);
    tumorve_pick = tumorve(:,pick);

    f = figure('Visible','off');
    scrsz = get(0,'ScreenSize');
    
    fs = 35;
    w = 0.2;
    
    subplot(511);
    boxplot(ser(:,pick),'labels', Mode(pick),'symbol','k.','colors',[0 0 0],...
    'widths',w,'whisker',1.5);
    set(findobj(gca,'-regexp','Tag','\w*Whisker'),'LineStyle','-');
    set(gca,'fontsize',fs);
    ylim([10 30]);
    set(gca,'fontsize',fs,'ytick',10:5:30);
    ylabel('SER','fontsize',fs);
    
    subplot(512);
    boxplot(cccKt(:,pick),'labels', Mode(pick),'symbol','k.','colors',[0 0 0],...
    'widths',w,'whisker',1.5);
    set(findobj(gca,'-regexp','Tag','\w*Whisker'),'LineStyle','-');
    set(gca,'fontsize',fs);
    ylim([0.4 1]);
    set(gca,'fontsize',fs,'ytick',0.4:0.2:1);
    ylabel('CCC\{K^{trans}\}','fontsize',fs);
    
    subplot(513);
    boxplot(cccve(:,pick),'labels', Mode(pick),'symbol','k.','colors',[0 0 0],...
        'widths',w,'whisker',1.5);
    set(findobj(gca,'-regexp','Tag','\w*Whisker'),'LineStyle','-');
    ylim([0.4 1]);
    set(gca,'fontsize',fs,'ytick',0.4:0.2:1);
    ylabel('CCC\{v_e\}','fontsize',fs);
    
    subplot(514);
    boxplot(tumorKt(:,pick),'labels', Mode(pick),'symbol','k.','colors',[0 0 0],...
        'widths',w,'whisker',1.5);
    set(findobj(gca,'-regexp','Tag','\w*Whisker'),'LineStyle','-');
    ylim([0.25 0.50]);
    set(gca,'fontsize',fs,'ytick',0.25:0.05:0.50);
    hold on;
    ylabel('Mean K^{trans}','fontsize',fs);
    plot([0,7],[0.4253,0.4253],'--r');
    
    subplot(515);
    boxplot(tumorve(:,pick),'labels', Mode(pick),'symbol','k.','colors',[0 0 0],...
        'widths',w,'whisker',1.5);
    set(findobj(gca,'-regexp','Tag','\w*Whisker'),'LineStyle','-');
    set(gca,'fontsize',fs);
    ylim([0.5 0.7]);
    set(gca,'fontsize',fs,'ytick',0.5:0.05:0.7);
    hold on;
    plot([0,7],[0.6354,0.6354],'--r');
    ylabel('Mean v_e','fontsize',fs);
    
    set(gcf,'Position',[scrsz(1),scrsz(2),scrsz(3),1.8*scrsz(4)]);
    set(gcf,'PaperPositionMode','auto');

    print -depsc2 ../ms/figure6.eps
    close(f);
    
end