function img = qetsr(img0,params)
% This fucntion implements the TGV-based compressed sensing reconstruction
% using FCSA scheme.
% Dong Wang 
% 11/01/2014

    A = params.A;
    At = params.At;
    iter = params.iter0;
    tol = params.tol;
    l = params.l;
    u = params.u;
    mode = params.mode;
    IMG = params.img;

    project = @(x,l,u) (((l<x)&(x<u)).*x)+((x>=u)*u)+(l*(x<=l));

    t = 1;
    img_r = zeros(size(img0));
    img = img0;
%     ser_old = 0;
    
    disp(['Run ',mode,' reconstruction']);
    for i = 1:iter

        img_old = img;
        img_g = img_r - At(A(img_r)) + img0;
        switch mode
            case 'L1'
                % Do the L1 of the image subproblem
                img_l1 = l1_solver(img_g,params.alpha_l1);
                
                img = img_l1;
            case 'FT'
                % Do the Fourier subproblem
                img_fft = ft_solver(img_g,params.alpha_fft);

                img = img_fft;
            case 'WT'
                % Do the Haar Wavelet subproblem
                img_wt = wt_solver(img_g,params.alpha_wt);
                
                img = img_wt;
            case 'TV'
                % Do the TV subproblem
                img_tv = TVsolver_temporal(img_g,params);

                img = img_tv;
            case 'TGV'
                % Do the TGV subproblem
                img_tgv = TGVsolver_temporal(img_g,params);

                img = img_tgv;
            case 'NN'
                % Do the low rank subproblem
                img_lr = lr_solver(img_g,params.alpha_lr);

                img = img_lr;
            otherwise
                disp('Please put in a proper mode');
        end

        % Do the projection
        img = project(img,l,u);
        % Update variables
        t_old = t;
        t = (1 + sqrt(1 + 4*t_old^2))/2;
        rate = norm(img(:) - img_old(:),'fro')/norm(img_old(:),'fro');
        if rate < tol;
            break;
        end
        img_r = img + (t_old - 1)/t*(img - img_old);
        ser = -20*log10(norm((abs(img(:)) - IMG(:)))/norm((IMG(:))));
%         if ser < ser_old
%             img = img_old;
%             break;
%         end
        fprintf('iter=%g,rate=%g,ser=%g\n',i,rate,ser);
%         ser_old = ser;
    end
end