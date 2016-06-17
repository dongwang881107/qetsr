function u = TVsolver_temporal(u0,params)
% This function implements TGV subproblem in the temporal dimension
% Dong Wang
% 09/11/2015
% load the parameters

alpha = params.alpha_tv; % weight of first order derivative
sigma = params.sigma; % dual step size
tau = params.tau; % prime step size
lambda = params.lambda; % weight of fidelity
iter = params.iter_tv; % iteration number

[n,m,d] = size(u0);

% define operators
projp = @(x) max(1,abs(x)/alpha);  % projection on convex sets P
prox = @(x) (lambda*x + tau*u0)/(lambda + tau); % proximal map operator
[dt,dtt] = TVOperator_temporal;

% initialize p=(p1,p2), q=(q1,q2,q3), v=(v1,v2), v_bar = (v_bar1,v_bar2)
p = zeros(n,m,d);
u = u0;
u_bar = u;

for i = 1:iter
    
    % update dual p
    eta = dt(u_bar);
    y = p + sigma*eta;
    p_proj = projp(y);
    p = y./p_proj;
    
    u_old = u;
    % update u
    eta2 = tau*(dtt(p)); 
    u = prox(u - eta2);
    u_bar = 2*u - u_old;
    
end