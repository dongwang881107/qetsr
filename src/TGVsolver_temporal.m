function u = TGVsolver_temporal(u0,params)
% This function implements TGV subproblem in the temporal dimension
% Dong Wang
% 09/11/2015
% load the parameters
alpha0 = params.alpha0; % weight of second order derivative
alpha1 = params.alpha1; % weight of first order derivative
sigma = params.sigma; % dual step size
tau = params.tau; % prime step size
lambda = params.lambda; % weight of fidelity
iter = params.iter_tgv; % iteration number

[n,m,d] = size(u0);

% define operators
projp  = @(x1) max(1,abs(x1)/alpha1);  % projection on convex sets P
projq  = @(x1) max(1,abs(x1)/alpha0); % projection on convex sets Q
prox = @(x) (lambda*x + tau*u0)/(lambda + tau); % proximal map operator
[dt,dtt] = TVOperator_temporal;
% dt     = @(x) [diff(x,1,3); x(:,:,1)-x(:,:,d)];   % discrete t-derivative
% dtt    = @(x) [x(:,:,d)-x(:,:,1); -diff(x,1,3)];  % transpose t-derivative

% initialize p=(p1,p2), q=(q1,q2,q3), v=(v1,v2), v_bar = (v_bar1,v_bar2)
p = zeros(n,m,d);
q = zeros(n,m,d);
u = u0;
u_bar = u;

v = zeros(n,m,d);
v_bar = v;

for i = 1:iter
    
    % update dual p
%     eta1 = dx(u_bar)- v_bar1;
%     eta2 = dy(u_bar) - v_bar2;
    eta = dt(u_bar) - v_bar;
    y = p + sigma*eta;
    p_proj = projp(y);
    p = y./p_proj;
    
    % update dual (q)
    zeta = dt(v_bar);
    z = q + sigma*zeta;
    q_proj= projq(z);
    q = q./q_proj;
    
    u_old = u;
    % update u
    eta2 = tau*(dtt(p)); 
    u = prox(u - eta2);
    u_bar = 2*u - u_old;
    % update primal v
   
    zeta2 = dtt(q) - p;
    v_old = v;
    v = v - tau*zeta2;
    
    % update v_bar
    v_bar = 2*v - v_old;
    
end