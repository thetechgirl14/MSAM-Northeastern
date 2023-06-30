function pivot_demo()
  
  A = [1e-17 1; 1 1]
  b = [1; 2]

  fprintf('Running naive_gauss (no pivoting)\n')
  x = naive_gauss_nopause(A,b)
  
  fprintf('Now running Matlab solver (with pivoting)\n')
  x = A\b
  
end