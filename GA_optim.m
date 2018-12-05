function [x, fval] = GA_optim(FitFun,varNum,lb,ub,opts)


ub1 = ones(1, varNum) * ub;
IntCon = 1:varNum;



[x,fval] = ga(FitFun, varNum, [], [], [], [], lb, ub1,...
   [], IntCon, opts);
end