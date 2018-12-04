% just for testing accuracy
clc

M = 3;
N = 3;
K = 2;
U = 3;
U_P = 3;
T = 5;

m = 1;
n = 3;
k = 2;
u = 3;
t = 5;
u_p = 3;

colNum = T*U*K*N*M*(1+U_P) + m + (n-1)*M + ...
    + (k-1)*N*M + (u-1)*K*N*M + (t-1)*U*K*N*M;

w_t = x(colNum)

colNum = T*U*K*N*M*(1+U_P) + m + (n-1)*M + ...
    + (k-1)*N*M + (u-1)*K*N*M + (t - 1 - 1)*U*K*N*M;

w_t1 = x(colNum)

E_u_p = 0;
for u_p = 1:U_P
    colNum = T*U*K*N*M +  m + (n-1)*M + (k-1)*N*M + ...
        + (u-1)*K*N*M + (u_p-1)*U*K*N*M +...
        + (t-1)*U_P*U*K*N*M;
    E_u_p = E_u_p + x(colNum);
end

E_u_p

d = w_t - w_t1 + E_u_p