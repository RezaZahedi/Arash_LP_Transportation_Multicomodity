function [B] = B_finalFun(M, N, K, U, T)

% tolerance:
tol = 0;
tol4 = 0;
tol31 = 0;
tol32 = 0;

%% first constraint:
S_initial = S_initialFun();

for i = 1:length(S_initial) 
    B(i, 1) = S_initial(i);
%     B(2*i-1, 1) = S_initial(i) + tol;
%     B(2*i, 1) = -S_initial(i) + tol;
end

%% third constraint:
D_initial = D_initialFun();

for i = 1:length(D_initial)
    aux(i, 1) = D_initial(i);
%     aux(2*i-1, 1) = D_initial(i) + tol31;
%     aux(2*i, 1) = -D_initial(i) + tol32;

%     aux(i, 1) = -D_initial(i) + tol;
end

B = vertcat(B, aux);

%% forth constraint:
% clear aux
% for k = 1:K
%     for u = 1:U
%         
%         aux2 = 0;
%         
%         for m = 1:M
%             for n = 1:N
%                 for t = 1:T
%                     
%                     colNum = m + (n-1)*M + (k-1)*N*M + (u-1)*K*N*M +...
%                         +(t-1)*U*K*N*M;
%                     aux2 = aux2 + D_initial(colNum);
%                     
%                 end
%             end
%         end
%         
%         aux3(k + (u-1)*K) = aux2;
%         
%     end
% end
% 
% for i = 1:length(aux3)
%     aux(2*i-1, 1) = aux3(i) + tol4;
%     aux(2*i, 1) = -aux3(i) + tol4;
% end
% 
% B = vertcat(B, aux);

end