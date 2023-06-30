close all

% Parameters
N = 100;
len = 1;
h = len/(N-1);

% Thermal diffusivity of copper
%alpha = 1.11e-4; 

% Thermal diffusivity of AISI 1010 carbon steel
alpha = 1.88e-5; 

Q = zeros(N,1);

% Heat applied to one element at node 23

Q(23) = 0.1; 
Q = -Q/(alpha*h);

% Create matrix
A = spdiags([ones(N,1),-2*ones(N,1),ones(N,1)],-1:1,N,N);
A(1,:) = 0;
A(1,1) = 1;
A(N,:) = 0;
A(N,N) = 1;
A = A/(h^2);

tol = 1e-5;

% Gauss-Seidel iteration
T = gauss_seidel(A, Q, tol);

True_T = A\Q;
x = linspace(0,1,N);
plot(x, T,'bx');
hold on;
plot(x,True_T, 'r.');
xlabel('Position on rod (m)');
ylabel('Temperature (C)');
hold off;
legend("Gauss Seidel", "MATLAB");
max_temp = max(T);

fprintf('For alpha = %d & N = %d, The maximum temperature is %.2f C.\n',alpha, N, max_temp);
