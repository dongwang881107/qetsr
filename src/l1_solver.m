function img = l1_solver(img0,alpha)
% This function implements the model of using l1 norm of the image using
% soft shrinkage
% 03/23/2014
% Dong Wang

    mag = abs(img0);
    phase = angle(img0);
    mag = mag - alpha;
    mag = mag.*(mag > 0);
    img = mag.*exp(1i*phase);

end