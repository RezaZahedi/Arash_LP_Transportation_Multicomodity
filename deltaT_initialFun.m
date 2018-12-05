function [deltaT] = deltaT_initialFun(M,N)
%deltaT = poissrnd(2,M,N);

deltaT = [0, 1, 3
    1, 0, 2
    3, 1, 0];
end