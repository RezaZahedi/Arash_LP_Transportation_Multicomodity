
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

% creating A and B matrices:
% B:
%B = B_finalFun(M, N, K, U, T);
B = B_finalFun(M, N, K, U, T);

tB = toc();
tB
tic;
% A:
% A = A_finalFun(M, N, K, U, U_P, T);
A = A_finalFun(M, N, K, U, U_P, T);
tA = toc;
tA

% removing equality constraints:
[m, n] = size(A);
% deviding A into AL and AR (A left and A right), A = [AL AR]:
AL = A(:, 1:(n-m));
AR = A(:, (n-m+1):n);

% X = [U D]'
% D = inv(AR) * B - inv(AR) * L * U ==>> D = D1 - D2 * U :
D1 = AR\B;
D2 = AR\AL;


%% Genetic algorytm:
f = Cost_initial(M, N, K, U, U_P, T);

FitnessFunction = @(Upper) CostFun(Upper, D1, D2, f);
numberOfVariables = n-m;

% 'InitialPopulationRange', [0;200],...
pop = 2600;
lb = zeros(1, n-m);
% ub = 5;
% opts = optimoptions(@ga, ...
%     'PopulationSize', pop, ...
%     'MaxGenerations', 200, ...
%     'EliteCount', pop*.05, ...
%     'InitialPopulationMatrix', lb,...
%     'UseVectorized', false, ...
%     'PlotFcn', @gaplotbestf)
% 
% [x, fval] = GA_optim(FitnessFunction,numberOfVariables,lb,ub,opts);
% 
% fval
x0 = lb;
tic;
i = 0
fval = FitnessFunction(x0)
toc
opts = optimoptions(@ga, ...
        'PopulationSize', pop, ...
        'MaxGenerations', 200, ...
        'EliteCount', pop*.05, ...
        'UseVectorized', true, ...
        'CrossoverFraction',.1,...
        'PlotFcn', @gaplotbestf);
for(i = 1:31:31)
    ub = i;
    
    opts = optimoptions(@ga, ...
        'PopulationSize', pop, ...
        'MaxGenerations', 200, ...
        'EliteCount', pop*.05, ...
        'InitialPopulationMatrix', x0,...
        'UseVectorized', true, ...
        'CrossoverFraction',.95,...
        'PlotFcn', @gaplotbestf);
    
    [x, fval] = GA_optim(FitnessFunction,numberOfVariables,lb,ub,opts);
    
    
    
    x0 = x;
    
    i
    fval
    toc
end
tGA = toc

%% pattern search:
% % % fitness function
% f = Cost_initial(M, N, K, U, U_P, T);
% 
% fun = @(Upper) CostFun(Upper, D1, D2, f);
% 
% 
% lb = zeros(1, n-m);
% ub = ones(1, n-m) * 31;
% 
% options = optimoptions('patternsearch',...
%     'Display','iter','PlotFcn',@psplotbestf);
% 
% [x, fval] = patternsearch(fun,lb,[],[],[],[],lb,ub,[],options);
% fval
