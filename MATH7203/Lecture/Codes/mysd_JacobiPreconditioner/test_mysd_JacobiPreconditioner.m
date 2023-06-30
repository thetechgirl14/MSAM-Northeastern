function test_mysd_JacobiPreconditioner()
  % This function tests my implementation of steepest descent
  % a.k.a. gradient descent.  It generates random matrices
  % with increasingly large condition numbers and feeds them
  % to mysd.

  % In this test, I first precondition the matrix using the Jacobi
  % preconditioner.  That is, I multiply the A matrix by its
  % diagonal, so the system I am solving is
  % P^-1 A x = P^-1 b
  % where P is the diagonal of A.

  % Vector of condition numbers to test.
  condvec = [2 5 10 20 50 100 200];

  % Matrix dimension
  n = 25;
  m = 25;

  % Tol for solution
  tol = 1e-5;
  fprintf('------  Test preconditioned gradient descent with matrix [%d, %d] and tol = %e  ------\n', n, m, tol)

  for condidx = 1:length(condvec)
    testcond = condvec(condidx);

    % Generate symmetric positive def matrix from A to send to mysd.
    %  A = randn_cond(n, m, testcond);
    A = sprandn_svdcond(n, m, testcond);
    
    S = A'*A;
    condS = cond(S);

    Pm1 = diag(1./diag(S));

    b = 10*randn(n, 1);

    Pm1S = Pm1*S;
    Pm1b = Pm1*b;

    fprintf('K = %f...', condS);

    x = mysd(Pm1S, Pm1b, tol);

    Nres = norm(Pm1b - Pm1S*x);
    fprintf(' ... normres =  %e.\n', Nres);
    
  end

end