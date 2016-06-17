function img = ft_solver(img0,alpha)
% This function implements the temporal fft shrinkage
% Dong Wang 
% 2015/11/22
    
    imgf = fft(img0,[],3);
    mag = abs(imgf);
    phase = angle(imgf);
%     mask = double(abs(imgf) > alpha);
%     imgf = imgf.*mask;
    mag = mag - alpha;
    mag = mag.*(mag > 0);
    imgf = mag.*exp(1i*phase);
    img = ifft(imgf,[],3);

end