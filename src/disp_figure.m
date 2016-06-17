% This demo displays all the figures generated in the paper
% Quantitative Evaluation of Temporal Sparse Regularizers in the 
% Reconstruction of Breast Dynamic Contrast Enhanced MRI
% Dong Wang
% 01/31/2016
function disp_figure(m,n,d,Mode,pick,name)
    
    disp_mask(m,n,d); % Figure 1
    disp_dces(); % Figure 2
    disp_ktandve(); % Figure 3
    disp_BA(); % Figure 4
    disp_curve_diff(); % Figure 5
    disp_boxplots(Mode,pick,name); % Figure 6
    
end