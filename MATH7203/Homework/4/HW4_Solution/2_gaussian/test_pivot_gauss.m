function test_pivot_gauss()
  % This fcn tests the impl of naive gauss

  pass = 0;
  fail = 0;

  % Test tolerance.
  tol = 1e-8;

  % Test matrices from 3x3 to 9x9, step 2.
  for N = 3:2:9
    fprintf('*********   Testing [%d, %d] matrix   ************\n', N, N)
    A = 10*randn(N,N);
    b = 10*randn(N, 1);

    xtrue = A\b;   % Use Matlab built-in for reference
    xcomp = pivot_gauss(A, b);   % Compute using my impl of Gauss elim.

    % Check if computed and true value are close enough to pass
    diff = norm(xtrue - xcomp);
    fprintf(' diff = %e\n', diff)
    if (diff < tol)
      fprintf('Pass!\n')
      pass = pass + 1;
    else
      fprintf('Fail!\n')
      fail = fail + 1;
    end

  end

  fprintf('************************************\n')
  fprintf('At end of test, pass = %d, fail = %d\n', pass, fail)
end
