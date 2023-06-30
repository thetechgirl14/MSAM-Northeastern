function test_mysd()
  % This function tests my implementation of steepest descent
  % a.k.a. gradient descent.  It generates random matrices
  % with increasingly large condition numbers and feeds them
  % to mysd.

  % Vector of condition numbers to test.
  condvec = [2 5 10 20 50 100 200];

  % Matrix dimension
  n = 25;
  m = 25;

  % Tol for solution
  tol = 1e-5;
  fprintf('------  Test gradient descent with matrix [%d, %d] and tol = %e  ------\n', n, m, tol)

  for condidx = 1:length(condvec)
    testcond = condvec(condidx);

    A = sprandn_svdcond(n, m, testcond);
    % A = randn_cond(n, m, testcond);

    % Generate symmetric positive def matrix from A to send to mysd.
    S = A'*A;
    condS = cond(S);

    fprintf('K = %f...', condS);

    b = 10*randn(n, 1);
    x = mysd(S, b, tol);

    Nres = norm(b - S*x);
    fprintf(' ... normres =  %e.\n', Nres);
    
  end

end