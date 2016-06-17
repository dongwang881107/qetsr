function wmat = vuCSHaar(N, k)


%WAVMAT returns a wavelet transformation matrix
% Input:
%   N: matrix dimension, which is required to be power of 2.
%   h: analysis lowpass filter
%   g: analysis highpass filter
%   k: number of scales of transformation
% Output:
%   wmat: wavelet transformation matrix
% Example:
%   [h, g, rh, rg] = wspline(2, 8); 
%   wmat = wavmat(8, h, g, 3);
%
%   Author: Jie Yan
%   Copyright 2009 ECE Department, University of Victoria.
%   $Revision: 1.0 $  $Date: Nov. 8th, 2009$ 

h = [1 1] / sqrt(2);
g = [-1 1] / sqrt(2);

h=h(:)';	% Arrange the filters so that they are row vectors.
g=g(:)';    % h = [h0 h1 ... ]; g = [g0 g1 ... ];

J = log2(N);
if (J ~= floor(J))
    error('The matrix dimension N has to be power of 2.');
end
if (k > J)
    error('The scale k is too high.');
end

% Delay calculation
% Note: delay calculation based on the absolute maxima location is applied
%           since it is also used in function "wt" in the toolbox "Uvi_Wave version 3.0 Universidade de
%           Vigo, 1996"
% dlp, dhp: delays of filters h and g
[mlp,dlp]=max(abs(h));
[mhp,dhp]=max(abs(g));
if rem(dhp-dlp,2) ~= 0		% difference between them.
	dhp=dhp+1;		% must be even
end;
llp=length(h);                	% Length of the lowpass filter
lhp=length(g);                	% Length of the highpass filter.

% Start the algorithm to calculate wavelet matrix
N0 = N;
wmat = eye(N0,N0);
for i = 1:k  
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculate w1N, the one scale N by N wavelet matrix    
     w1N = zeros(N,N);
    
    % Generate the prototype row for h
    hrowproto = zeros(1, N);
    loc_h0 = 1+mod(dlp, N); % locate the column index of h0
    cur_loc = loc_h0; 
    for l = 1:llp                         % periodical extension and addition
        hrowproto(cur_loc) = hrowproto(cur_loc)+h(l); 
        cur_loc = cur_loc-1; 
        cur_loc = N-mod(N-cur_loc, N);
    end

    % Generate the prototype row for g
    growproto = zeros(1, N);
    loc_g0 = 1+mod(dhp, N); % locate the column index of g0
    cur_loc = loc_g0; 
    for l = 1:lhp                         % periodical extension and addition
        growproto(cur_loc) = growproto(cur_loc)+g(l); 
        cur_loc = cur_loc-1; 
        cur_loc = N-mod(N-cur_loc, N);
    end

    % Generate the one scale N by N wavelet matrix
    for l = 1:N/2
        w1N(l, :) = circshift(hrowproto, [0, 2*(l-1)]);     
        w1N(l+N/2, :) = circshift(growproto, [0, 2*(l-1)]);      
    end   
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    w2Np = [w1N, zeros(N, N0-N); zeros(N0-N, N), eye(N0-N)];
    wmat = w2Np*wmat;
    N = N/2;
end

 