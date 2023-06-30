function s = test_condition_error(k0)
  % This function generates random matrices with condition 
  % number k0, then  solves Ax=b, gets the residual, and 
  % prints the norm of the residual

  % Run this program with k0 > 3.  Try 10, 100, 1000, etc.

  n = 7;

  A = randn_cond(n, n, k0);
  b = randn(n, 1);
  % Here I can turn on one of:
  % Naive gauss
   
  %x = naive_gauss(A, b);
  %x = gauss_jordan_elim(A, b);
  x = A\b;
  r = b - A*x;
  s = norm(r);

end

