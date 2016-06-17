function disp_table(Mode,pick,name)
% This function generates the table in the paper
% Dong Wang
% 04/07/2016

    load(name,'ser','cccKt','cccve'); 
    
    ser_pick = ser(:,pick);
    cccKt_pick = cccKt(:,pick);
    cccve_pick = cccve(:,pick);
    
    ser_mean = mean(ser_pick);
    ser_std = std(ser_pick);
    cccKt_mean = mean(cccKt_pick);
    cccKt_std = std(cccKt_pick);
    cccve_mean = mean(cccve_pick);
    cccve_std = std(cccve_pick);

    f = fopen('../ms/table2.tex','w');
    for i = 1:length(pick)
        fprintf(f,'%s & %.1f$\\pm$%.4f & %.3f$\\pm$%.4f & %.3f$\\pm$%.4f\\\\\n',...
            Mode{pick(i)},ser_mean(i),ser_std(i),cccKt_mean(i),...
            cccKt_std(i),cccve_mean(i),cccve_std(i));
    end
    fclose(f);
    
end
