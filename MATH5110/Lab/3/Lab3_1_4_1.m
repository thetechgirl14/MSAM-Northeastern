B(1) = 10;
F(1) = 1;
P = [B(1); F(1)];

alpha_b_beta_b = 2;
gamma_f = 2;
rho_b = 3;
beta_f = 0.5;

a = 1 + alpha_b_beta_b;
b = -gamma_f;
c = rho_b;
d = 1 - beta_f;

N = [1, 4, 7, 10, 13, 16, 19, 22, 25];

A = [[a, b]; [c, d]];

eigs = eig(A);

disp(A);
disp(eigs);
% disp([[eigs(1), 0]; [0, eigs(2)]]^N(9));

plotphase(A, -2:8, -2:8, N);
