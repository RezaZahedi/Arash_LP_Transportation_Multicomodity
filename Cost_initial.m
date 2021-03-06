function f = Cost_initial(M, N, K, U, U_P, T)
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

end
