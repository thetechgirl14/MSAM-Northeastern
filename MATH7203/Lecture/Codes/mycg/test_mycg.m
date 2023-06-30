function test_mycg()
  % This function tests my implementation of conjugate 
  % gradient.  It generates random matrices
  % with increasingly large condition numbers and feeds them
  % to mycg.

  % Vector of condition numbers to test.
  condvec = [2 5 10 20 50 100];

  % Matrix dimension
  n = 80;
  m = n;

  % Tol for solution
  tol = 1e-5;
  fprintf('------  Test cg with matrix [%d, %d] and tol = %e  ------\n', n, m, tol)

  for condidx = 1:length(condvec)
    testcond = condvec(condidx);

    % A = randn_cond(n, m, testcond);
    A = sprandn_svdcond(n, m, testcond);

    % Generate symmetric positive def matrix from A to send to mycg.
    S = A'*A;
    condS = cond(S);

    fprintf('K = %f...', condS);

    b = 10*randn(n, 1);
    x = mycg(S, b, tol);

    % Compute norm of residual as measure of accuracy
    Nres = norm(b - S*x);
    fprintf('   ... normres =  %e.\n', Nres);
    
  end

end
