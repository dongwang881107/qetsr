% This demo tests different sparsity constraints on
% temporal dimension using FCSA. There are four temporal constraints in
% total, namely fft(temporal fourier), tv(temporal total variation),
% tgv(temporal total  generalized variation), nn(nuclear norm)
% Dong Wang 
% 12/05/2014

%% Load and generate breast DCE-MRI
clear;
load ../data/breast_dce_16ch_105dyn.mat;
img = abs(data(:,1:128,:));
scale = max(abs(img(:)));
img = img/scale;
[m,n,d] = size(img);

%% Run DCE Modeling for the original data
DCEdata = shiftdim(abs(data),2);
load ../data/dce_params.mat;
outfile = '../out/dce_ori_out.mat';
save ('../out/dce_ori.mat','SERcutoff','t','Cp','T1data','TR','DCEflip','T1flip',...
    'DCEdata','outfile');
julia('dcerun_ori.jl');

%% Generate undersampling mask
mask_num = 1; % Number of generated masks
width = 10; % Central window width
accel = 8; % Acceleration factor
Mask = zeros(m,n,d,mask_num);
rng(5089);
for i = 1:mask_num
    mask_seed = 1000*i;
    mask = vuCSRandMaskCadence([n,m],accel,d,width,false,mask_seed);
    mask = mask';
    mask = repmat(mask,[1,1,n]);
    mask = shiftdim(mask,1);
    Mask(:,:,:,i) = mask;
end
clear i;

%% Initialize output variables
Mode = {'Zero Filled','L1','FT','WT','TV','TGV','NN'};
mode_num = length(Mode);
pick = [1,3,4,5,6,7]; % Number of mode selected

ser = zeros(mask_num,mode_num);
cccKt = zeros(mask_num,mode_num);
cccve = zeros(mask_num,mode_num);
tumorKt = zeros(mask_num,mode_num);
tumorve = zeros(mask_num,mode_num);

%% Run the main function
for i = 1:mask_num
    for j = 1:length(pick)
        tic;
        mask = Mask(:,:,:,i);
        mode = Mode{pick(j)};
                
        [A,At] = FFTOperator(mask);
        b = A(img);
        zerofill = At(b);
        
        if strcmp(mode,'Zero Filled')
            disp(['Running ',num2str(i),'th mask']);
            disp('Zerofill');
            ser(i,pick(j)) = -20*log10(norm((abs(zerofill(:)) - img(:)))/norm((img(:))));
            fprintf('ser=%g\n',ser(i,pick(j)));
            output = DCEModeling(abs(zerofill),scale,mode);
        else    
            params = ParamsGenerator(A,At,img,mode);
            params.mode = mode;

            disp(['Running ',num2str(i),'th mask']);
            img_recon = qetsr(zerofill,params);
            img_recon = reshape(img_recon,[m,n,d]);

            ser(i,pick(j)) = -20*log10(norm((abs(img_recon(:)) - img(:)))/norm((img(:))));
            fprintf('ser=%g\n',ser(i,pick(j)));
            output = DCEModeling(img_recon,scale,mode); 
        end
        
        cccKt(i,pick(j)) = output.cccKt;
        cccve(i,pick(j)) = output.cccve;
        tumorKt(i,pick(j)) = output.tumorKt;
        tumorve(i,pick(j)) = output.tumorve; 
        
    end
end

%% Save all the results to a mat file for later use
under = [];
for k = 1:length(pick)
    under = strcat(under,num2str(pick(k)));
end
name = ['../out/result_v0.4_',under,'_',num2str(mask_num),'.mat'];
save(name,'-v7.3','ser','cccKt','cccve','Mask','tumorKt','tumorve');

%% Plot the figures and tables in the paper
disp_figure(m,n,d,Mode,pick,name);
disp_table(Mode,pick,name);
