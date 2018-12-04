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

FitnessFunction = @(x) CostFun(x, M, N, K, U, U_P, T);

numberOfVariables = 1440;

lb = zeros(1, length(A));
ub = ones(1, length(A)) * 50;

IntCon = 1:1440;

opts = optimoptions('ga','MaxStallGenerations',50,'FunctionTolerance',...
    1e-10,'MaxGenerations',300,'PlotFcn',@gaplotbestfun);

[x,fval] = ga(FitnessFunction, numberOfVariables, A, B, [], [], lb, ub,...
    [], IntCon, opts)
