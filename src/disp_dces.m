function disp_dces()

    f = figure('Visible','off');
    subplot(211);disp_dce(105);title('(a)','fontsize',8);
    subplot(212);disp_dce(1);title('(b)','fontsize',8);
    createarrow(f);

    print -depsc2 ../ms/figure2.eps;
    close(f);

end