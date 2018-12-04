function z = CostFun(x, M, N, K, U, U_P, T)
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

z = 0;

for i = 1:length(f)
    z = z + f(i)*x(i);
end

% for i = 1:M*N*K*U*T
%     z = z + C*x(i);
% end
% for i = i+1:M*N*K*U*U_P*T
%     z = z + G*x(i);
% end
end