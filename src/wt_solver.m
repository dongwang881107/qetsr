function img = wt_solver(img0,alpha)
% This function implement wavelet subproblem using soft thresholding
% Dong Wang
% 03/23/2016
    
    [m,n,d] = size(img0);
    img0 = reshape(img0,m*n,d);
    
    e = nextpow2(d);
    e = 2^e;
    
    img0_pad = zeros(m*n,e);
    img0_pad(:,1:d) = img0;
    
    W = vuCSHaar(e,1);
    
    img0_pad_wt = W*img0_pad.';
%     img0_pad_wt = img0_pad*W;
    
    mag = abs(img0_pad_wt);
    phase = angle(img0_pad_wt);
    
    mag = mag - alpha;
    mag = mag.*(mag > 0);
    
    img0_pad_iwt = mag.*exp(1i*phase);
    img0_pad_iwt = (W'*img0_pad_iwt).';
%     img0_pad_iwt = img0_pad_iwt*W';
    
    img = img0_pad_iwt(:,1:d);
    img = reshape(img,[m,n,d]);
        
end