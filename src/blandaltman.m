function blandaltman(value1,value2,mode,value)

    dv = value2(:) - value1(:);
    mv = 0.5*(value1(:)+value2(:));
    
    plot([0 1],[1 1]*mean(dv),'r-','LineWidth',1.5); hold on;
    plot([0 1],[1.96 1.96]*std(dv),'r:','LineWidth',1.5); hold on;
    plot([0 1],[-1.96 -1.96]*std(dv),'r:','LineWidth',1.5); hold on;
    
    scatter(mv,dv,30,'filled','o','MarkerEdgeColor',[0,0,0],'MarkerFaceColor',[0,0,0]);

    alpha(0.4);
    set(gca,'XTick',0:0.25:1);
    set(gca,'YTick',-1:0.5:1);
    set(gca,'YLim',[-1,1]);
    
    fs = 13;
    if strcmp(value,'Kt')
        xlabel('Mean K^{trans}','fontsize',fs);
    elseif strcmp(value,'ve')
        xlabel('Mean v_e','fontsize',fs);
    end
    ylabel([mode,' Diff'],'fontsize',fs);
    set(gca,'fontsize',fs);
  
end