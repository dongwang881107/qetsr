function CCC = ccc(x,y)
% compute the concordance correlation coefficient
% by Xia Li
x = x(:);
y = y(:);
mu1 = mean(x);
mu2 = mean(y);
s1 = var(x)*(length(x)-1)./length(x);
s2 = var(y)*(length(y)-1)./length(y);
% temp = cov(x,y);
% s12 = temp(1,2);
s12 = sum((x-mu1).*(y-mu2))/length(x); 
CCC = 2*s12/(s1+s2+(mu1-mu2).^2);
