function [A] = A_finalFun(M, N, K, U, U_P, T)
% deltaT matrix:
deltaT = deltaT_initialFun(M,N);

%% creating A (coefficients matrix):
%##########################333###### A = sparse(?,?)
%--------------------------------------------------------------------------
% first set of constraints:
nrow = N*K*U*T*(1+M);
ncol = M*N*K*U*T*(2+U_P)+N*K*U*T;
%A = spalloc(nrow, ncol, .0005*nrow*ncol);
gg = 1;
rowNum = 1;
for n = 1:N
    for k = 1:K
        for u = 1:U
            for t = 1:T
                for m = 1:M % assigning "x" coef.
                    % "x_n,m"
                    colNum = n + (m-1)*N + (k-1)*N*M + (u-1)*K*N*M + ...
                        + (t-1)*U*K*N*M;2;
                    ti(gg) = rowNum;
                    tj(gg) = colNum;
                    tv(gg) = 1;
                    gg = gg + 1;
%                     A(rowNum, colNum) = 1;
%                     A(rowNum + 1, colNum) = -1;
                    
                    if t > deltaT(m, n)
                        % "x_m,n"
                        colNum = m + (n-1)*M + (k-1)*N*M + (u-1)*K*N*M + ...
                            + (t - deltaT(m, n) - 1)*U*K*N*M;
                        ti(gg) = rowNum;
                        tj(gg) = colNum;
                        tv(gg) = -1;
                        gg = gg + 1;
%                         A(rowNum, colNum) = -1;
%                         A(rowNum + 1, colNum) = 1;
                    end % end of "x" coef.
                    
                    for u_p = 1:U_P % assigning "E" coef.
                        % "E_n,m"
                        colNum = T*U*K*N*M +  n + (m-1)*N + (k-1)*N*M + ...
                            + (u-1)*K*N*M + (u_p-1)*U*K*N*M +...
                            + (t-1)*U_P*U*K*N*M;
                        ti(gg) = rowNum;
                        tj(gg) = colNum;
                        tv(gg) = 1;
                        gg = gg + 1;
%                         A(rowNum, colNum) = 1;
%                         A(rowNum + 1, colNum) = -1;
                        
                        if t > (deltaT(m, n) + 2)
                            % "E_m,n"
                            colNum =  T*U*K*N*M +  m + (n-1)*M +...
                                + (k-1)*N*M + (u-1)*K*N*M +...
                                + (u_p-1)*U*K*N*M + ...
                                + (t - deltaT(m, n) - 2 - 1)*U_P*U*K*N*M;
                            ti(gg) = rowNum;
                            tj(gg) = colNum;
                            tv(gg) = -1;
                            gg = gg + 1;
%                             A(rowNum, colNum) = -1;
%                             A(rowNum + 1, colNum) = 1;
                        end
                    end % end of "E" coef.
                end
                % assigning "i" coef.
                colNum = T*U*K*N*M*(2+U_P) + n + (k-1)*N + (u-1)*K*N + ...
                    + (t-1)*U*K*N;
                ti(gg) = rowNum;
                tj(gg) = colNum;
                tv(gg) = 1;
                gg = gg + 1;
%                 A(rowNum, colNum) = 1;
%                 A(rowNum + 1, colNum) = -1;
                
                if t > 1
                    colNum = T*U*K*N*M*(2+U_P) + n + (k-1)*N +...
                        + (u-1)*K*N + (t - 1 - 1)*U*K*N;
                    ti(gg) = rowNum;
                    tj(gg) = colNum;
                    tv(gg) = -1;
                    gg = gg + 1;
%                     A(rowNum, colNum) = -1;
%                     A(rowNum + 1, colNum) = 1;
                end % end of "i" coef.
                
%                 rowNum = rowNum + 2;   
                rowNum = rowNum + 1;   
            end
        end
    end
end

%--------------------------------------------------------------------------
% second set of constraints:
%
%           none!

%--------------------------------------------------------------------------
%% third set of constraints:
for m = 1:M
    for n = 1:N
        for k = 1:K
            for u = 1:U
                for t = 1:T
                    % assigning "E" coef.
                    for u_p = 1:U_P
                        colNum = T*U*K*N*M +  m + (n-1)*M + (k-1)*N*M + ...
                            + (u-1)*K*N*M + (u_p-1)*U*K*N*M +...
                            + (t-1)*U_P*U*K*N*M;
                        ti(gg) = rowNum;
                        tj(gg) = colNum;
                        tv(gg) = 1;
                        gg = gg + 1;
%                         A(rowNum, colNum) = 1;
%                         A(rowNum + 1, colNum) = -1;
%                         A(rowNum, colNum) = -1;
                    end
                    % end of "E" coef.
                    
                    % assigning "W" coef.
                    colNum = T*U*K*N*M*(1+U_P) + m + (n-1)*M + ...
                        + (k-1)*N*M + (u-1)*K*N*M + (t-1)*U*K*N*M;
                    ti(gg) = rowNum;
                    tj(gg) = colNum;
                    tv(gg) = 1;
                    gg = gg + 1;
%                     A(rowNum, colNum) = 1;
%                     A(rowNum + 1, colNum) = -1;
%                     A(rowNum, colNum) = -1;
                    
                    if t > 1
                        colNum = T*U*K*N*M*(1+U_P) + m + (n-1)*M +...
                            + (k-1)*N*M + (u-1)*K*N*M + (t - 1 - 1)*U*K*N*M;
                        ti(gg) = rowNum;
                        tj(gg) = colNum;
                        tv(gg) = -1;
                        gg = gg + 1;
%                         A(rowNum, colNum) = -1;
%                         A(rowNum + 1, colNum) = 1;
%                         A(rowNum, colNum) = 1;
                    end
                    % end of "W" coef.
%                     rowNum = rowNum + 2;
                    rowNum = rowNum + 1;
                end
            end
        end
    end
end

%--------------------------------------------------------------------------
% %% forth set of constraints:
% for k = 1:K
%     for u = 1:U
%         for n = 1:N
%             % assigning "i" coef.
%             colNum = T*U*K*N*M*(2+U_P) + n + (k-1)*N + (u-1)*K*N +...
%                 + (T-1)*U*K*N;
%             A(rowNum, colNum) = -1;
%             A(rowNum + 1, colNum) = 1;
%             % end of "i" coef.
%             
%             for m = 1:M
%                 % assigning "W" coef.
%                 colNum = T*U*K*N*M*(1+U_P) + m + (n-1)*M + (k-1)*N*M + ...
%                     + (u-1)*K*N*M + (T-1)*U*K*N*M;
%                 A(rowNum, colNum) = 1;
%                 A(rowNum + 1, colNum) = -1;
%                 % end of "W" coef.
%                 
%                 for u_p = 1:U_P
%                     for t = 1:T
%                         % assigning "E" coef.
%                         colNum = T*U*K*N*M +  m + (n-1)*M + (k-1)*N*M + ...
%                             + (u-1)*K*N*M + (u_p-1)*U*K*N*M + ...
%                             + (t-1)*U_P*U*K*N*M;
%                         A(rowNum, colNum) = 1;
%                         A(rowNum + 1, colNum) = -1;
%                         % end of "E" coef.
%                     end
%                 end
%             end
%         end
%         
%         rowNum = rowNum + 2;
%     end
% end
% 
%% Sparsing A:
A = sparse(ti, tj, tv);
end