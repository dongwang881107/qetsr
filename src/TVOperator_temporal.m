function [D,Dt] = TVOperator_temporal
% This function defines the TV and TV transpose operator,3D version
%     [m,n,d] = size(x);
    
    D = @(x)TVForward(x);
    Dt = @(x)TVBackward(x);
    
    function TVt = TVForward(x)
        % Computer gradient along t-axis
        
%         TVt = x(:,:,[2:end,1]) - x;
        TVt = x(:,:,[2:end,end]) - x;
%         TVt = x(:,:,[1,1:end-1]) - x;
%         TVt = x(:,:,[1,2:end-1,end]) - x;
        
    end

    function TVttrans = TVBackward(TVt)

%         TVttrans = -TVt + TVt(:,:,[end,1:end-1]);
        TVttrans = -TVt + TVt(:,:,[1,1:end-1]);
        TVttrans(:,:,1) = -TVt(:,:,1);
        TVttrans(:,:,end) = TVt(:,:,end-1);
%         TVttrans = -TVt + TVt(:,:,[2:end,end]);
%         TVttrans = -TVt + TVt(:,:,[])
    end

end