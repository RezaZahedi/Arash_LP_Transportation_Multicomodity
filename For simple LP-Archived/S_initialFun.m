function [x] = S_initialFun(N, K, U, T)
      
x = poissrnd(17, N*K*U*T,1);

end