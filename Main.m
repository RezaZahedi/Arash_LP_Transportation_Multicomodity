
clear
clc
tic;
% initial values and dimentions:
M = 3;
N = 3;
K = 2;
U = 3;
U_P = 3;
T = 5;

% B:
%B = B_finalFun(M, N, K, U, T);
Beq = B_finalFun(M, N, K, U, T);

% A:
% A = A_finalFun(M, N, K, U, U_P, T);
Aeq = A_finalFun(M, N, K, U, U_P, T);

% finging initial solution
A2=Aeq(:,1081:1440);
x0 = zeros(1,1440);
x0(1, 1081:1440) = round(A2\Beq)';

%% linear programming:
% fitness function
C = 4;
P = 2;
B = 8;
V = -1;
G = 8;
f = repelem(C, M*N*K*U*T);
f = horzcat(f, repelem(G, M*N*K*U*U_P*T));
f = horzcat(f, repelem(P, M*N*K*U*(T-1)));
f = horzcat(f, repelem(B, M*N*K*U));
f = horzcat(f, repelem(0, N*K*U*(T-1)));
f = horzcat(f, repelem(V, N*K*U));


lb = zeros(1, length(Aeq));
ub = ones(1, length(Aeq)) * 2000;
IntCon = 1:1440;


options = optimoptions(@intlinprog,'OutputFcn',@savemilpsolutions,'PlotFcn',@optimplotmilp);

[x, fval] = intlinprog(f,IntCon,[],[],Aeq,Beq,lb,ub,x0,options)

time = toc
%% pattern search:
% % fitness function
% fun = @(x) CostFun(x, M, N, K, U, U_P, T);
% 
% 
% lb = zeros(1, length(Aeq));
% ub = ones(1, length(Aeq)) * 2000;
% 
% options = optimoptions('patternsearch',...
%     'Display','iter','PlotFcn',@psplotbestf);
% 
% [x, fval] = patternsearch(fun,x0,[],[],Aeq,Beq,lb,ub,[],options)
% % 

%% Genetic algorytm:

% FitnessFunction = @(x) CostFun(x, M, N, K, U, U_P, T);
% numberOfVariables = 1440;
% 
% lb = zeros(1, length(A));
% ub = ones(1, length(A)) * 60;

% IntCon = 1:1440;
% 
% % 'InitialPopulationRange', [0;200],...

% opts = optimoptions(@ga, ...
%     'PopulationSize', 5000, ...
%     'InitialPopulationMatrix', x0,...
%     'MaxGenerations', 200, ...
%     'EliteCount', 100, ...
%     'CrossoverFraction', .8,...
%     'FunctionTolerance', 1e-8, ...
%     'UseVectorized', true, ...
%     'PlotFcn', @gaplotbestf)
% 
% 
% [x,fval] = ga(FitnessFunction, numberOfVariables, A, B, [], [], lb, ub,...
%    [], IntCon, opts);
% 
% fval
