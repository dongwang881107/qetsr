% This function displays the Cartesian sampling mask
% Dong Wang 
% 12/15/2015
function disp_mask(m,n,d)

    Mask = vuCSRandMaskCadence([n,m],8,d,10);
    mask = Mask(:,50)';
    mask = squeeze(repmat(mask,[1,1,n]));

    f = figure('Visible','off');
    imshow([Mask,ones(m,40),mask]);
    
    saveas(gcf,'../ms/figure1.eps');
    close(f);
    
end