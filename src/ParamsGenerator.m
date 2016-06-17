function params = ParamsGenerator(A,At,img,mode)
% This function generates params for demo_TGVLR_FCSA.m
% Dong Wang
% 12/05/2015

    % For main function
    tol = 1e-3;   % stopping rule
    l = 0;        % lower bound projection
    u = 1;        % upper bound projection

    params.tol = tol;
    params.l = l;
    params.u = u;
    params.A = A;
    params.At = At;
    params.img = img;

    switch mode
        case 'L1'
            alpha_l1 = 8.1e-3; % soft threshold parameter of l1 solver
            iter0 = 60;
            
            params.alpha_l1 = alpha_l1;
            params.iter0 = iter0;
            
        case 'WT'
            alpha_wt = 8e-3;
            iter0 = 60;
            
            params.alpha_wt = alpha_wt; % soft threshold parameter for wt solver
            params.iter0 = iter0;
            
        case 'FT'
            alpha_fft = 5.9e-2; % soft threshold parameter for fft solver
            iter0 = 35;
            
            params.alpha_fft = alpha_fft;
            params.iter0 = iter0;
            
        case 'TV'
            alpha_tv = 5e-1; % weight of derivative for tv solver
            iter0 = 100; % iteration function for the main function
            iter_tv = 2;
            lambda = 5e-1;
            sigma = 0.2;
            tau = 0.2;

            params.alpha_tv = alpha_tv;
            params.iter0 = iter0;
            params.iter_tv = iter_tv;
            params.lambda = lambda;
            params.sigma = sigma;
            params.tau = tau;
            
        case 'TGV'
            alpha0 = 5e-1;   % weight of second derivative for tgv solver
            alpha1 = 2*alpha0;   % weight of first derivative for tgv solver
            lambda = 5e-1;   % weight of fidelity for tgv solver
            sigma = 0.2; % prime factor for tgv solver
            tau = 0.2; % dual factor for tgv solver
            iter0 = 100; % iteration number for the main function
            iter_tgv = 2;   % iteration number for tgv/tv solver

            params.alpha0 = alpha0;
            params.alpha1 = alpha1;
            params.lambda = lambda;
            params.sigma = sigma;
            params.tau = tau;
            params.iter0 = iter0;
            params.iter_tgv = iter_tgv;
            
        case 'NN'
            alpha_lr = 3e-1; % weight of nuclear norm
            p = 1; % nuclear norm
            iter0 = 40; % iteration number for the main function

            params.alpha_lr = alpha_lr;
            params.p = p;
            params.iter0 = iter0;
            
        otherwise
            disp('Please put in a proper mode');
    end

end