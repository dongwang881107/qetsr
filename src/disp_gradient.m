% This demo shows the gradient decay in three dimensions
% Results show that gradient in temporal direction has the fastest decay
% Dong Wang
% 12/16/2015
function disp_gradient()
    % Load dynamic data
    
    load ../data/breast_dce_16ch_105dyn.mat;

    % Define difference operators
    dx = @(x) x([2:end,end],:,:) - x;
    dy = @(x) x(:,[2:end,end],:) - x;
    dt = @(x) x(:,:,[2:end,end]) - x;

    Dx = dx(data); Dx = abs(Dx(:)/max(abs(Dx(:)))); Dx = flip(sort(Dx));
    Dy = dy(data); Dy = abs(Dy(:)/max(abs(Dy(:)))); Dy = flip(sort(Dy));
    Dt = dt(data); Dt = abs(Dt(:)/max(abs(Dt(:)))); Dt = flip(sort(Dt));

    % Plot the curves
    f = figure('Visible','off');
    
    font_size = 15;
    
    plot(Dx(1:3e5),'k--','LineWidth',2);hold on;
    plot(Dy(1:3e5),'k:','LineWidth',2);hold on;
    plot(Dt(1:3e5),'k-','LineWidth',2);
    xlabel('Sorted Coefficient Number','fontsize',font_size);
    ylabel('Magnitude','fontsize',font_size);
    h = legend('\nabla_x','\nabla_y','\nabla_t');
    set(h,'Fontsize',font_size);
    h.Box = 'off';
    set(gca,'Fontsize',font_size);
    saveas(gcf,'../ms/figure2.eps');
    close(f);
    
end