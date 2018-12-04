clear
clc

% initial values and dimentions:
M = 3;
N = 3;
K = 2;
U = 3;
U_P = 3;
T = 5;

% B:
B = B_finalFun(M, N, K, U, T);

% A:
A = A_finalFun(M, N, K, U, U_P, T);

f = CostFun( M, N, K, U, U_P, T);

numberOfVariables = 1440;

lb = zeros(1, length(A));
ub = ones(1, length(A)) * 5000;

[x,fval] = linprog(f, [], [], A, B, lb, ub)
