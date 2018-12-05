function [deltaT] = deltaT_initialFun(M,N)
deltaT = poissrnd(2,M,N);
end