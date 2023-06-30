function u = test_gauss_seidel()
  % This tests the Gauss-Seidel solver for SPD
  % input matrix.

  tol = 1e-5;
  pass = 0;
  fail = 0;
    
  Ns = [3 7 17 23 56 103];
  
  for i = 1:length(Ns)
    N = Ns(i);
    fprintf('Testing matrix of size %dx%d. \n', N, N)
    B = randn(N,N);
    A = B'*B;   % A is SPD.

    b = randn(N, 1);
    
    % Now solve system using iterative method.
    [ugs, itr] = gauss_seidel(A, b, tol);

    fprintf('Number of Gauss-Seidel iterations for solution = %d\n', itr)

    % Check the residual is smaller than tol.
    normres = norm(b - A*ugs);
    fprintf('Checking result.... normres = %e ....', normres)
    if (normres < tol)
      fprintf('Passed!\n')
      pass = pass+1;
    else
      fprintf('Failed!\n')
      fail = fail+1;
    end
    
    fprintf('-----------------------------------\n')
  end

  fprintf('At end of test, pass = %d, fail = %d.\n', pass, fail)

end
