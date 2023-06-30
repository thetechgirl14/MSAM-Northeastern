%% Test program for mysd()

N_values = 0:5:40;

tol = 1e-13;

num_iter_sd = zeros(size(N_values));
num_iter_cg = zeros(size(N_values));
num_iter_pc = zeros(size(N_values));
for i = 1:length(N_values)
    N = N_values(i);
    
    A = K2D(N, N);
    b = randn(N^2, 1);
    
    num_iter_sd(i) = mysd(A, b, tol);
    
    num_iter_cg(i) = mycg(A, b, tol);
    
    L = ichol(A);
    M = L \ (L' \ eye(N^2));
    b_hat = L \ b;
    num_iter_pc(i) = mysd(M * A, M * b_hat, tol);
   
end

figure;
plot(N_values, num_iter_sd, 'o', 'DisplayName', 'Gradient descent');
hold on;
%plot(N_values, num_iter_cg, '*', 'DisplayName', 'Conjugate gradient');
plot(N_values, num_iter_pc, 's', 'DisplayName', 'Preconditioned GD');
xlabel('Matrix size (N)');
ylabel('Number of iterations');
title('Comparison of iterative methods');
legend('Location', 'Northwest');
hold off