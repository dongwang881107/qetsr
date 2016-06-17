% This function saves the histograms in the paper
% Dong Wang
% 03/08/2016

function disp_boxplots_ser(Mode,pick,name)
    
    load(name,'ser');
    
    ser_pick = ser(:,pick);
    
    f = figure('Visible','off');
    scrsz = get(0,'ScreenSize');
    
    fs = 35;
    w = 0.2;
    
    boxplot(ser(:,pick),'labels', Mode(pick),'symbol','k.','colors',[0 0 0],...
    'widths',w,'whisker',1.5);
    set(findobj(gca,'-regexp','Tag','\w*Whisker'),'LineStyle','-');
    set(gca,'fontsize',fs);
    ylim([10 30]);
    set(gca,'fontsize',fs,'ytick',10:5:30);
    ylabel('SER','fontsize',fs);
    
    set(gcf,'Position',[scrsz(1),scrsz(2),scrsz(3),scrsz(4)]);
    set(gcf,'PaperPositionMode','auto');

    print -depsc2 ../ms/figure3.eps
    close(f);
    
end