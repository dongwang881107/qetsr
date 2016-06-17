function [img,l] = lr_solver(img,beta)
% This function implements the low rank shrinkage algorithm with p=1
% Dong Wang
% 11/04/2014
    p = 1;
    
    [m,n,d] = size(img);
    [u,s,v] = svd(reshape(img,[m*n,d]),'econ');
    s = diag(s);
    thres = beta.*(s.^(p - 1));
    s = s - thres;
    s = s.*(s>0);
    img = u*diag(s)*v';
    img = reshape(img,[m,n,d]);
    l = sum(s);
end