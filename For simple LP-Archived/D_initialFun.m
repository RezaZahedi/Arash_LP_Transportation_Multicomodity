function [x] = D_initialFun(M, N, K, U, T)
x = poissrnd(10, M*N*K*U*T,1);
end