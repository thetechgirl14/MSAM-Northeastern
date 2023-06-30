 function [x, itr] = gauss_seidel(A, b, tol)
  % This solves the linear system Ax = b iteratively using Gauss-Seidel.
  % 
  % This method converges if the spectral radius of A is < 1
  % Usually this may be idetified when the matrix is "diagonally dominant".

  % Separate A into L, U, D.  These are computed
  % once and then kept as constants
  L = tril(A, -1);
  D = diag(diag(A));
  LDm1 = inv(L+D);
  
  U = triu(A, 1);

  % Now iterate
  xn = b;  % First guess
  % Iterate for finite number of times to prevent infinite loops.
  for idx = 1:1000000
    xnp1 = LDm1*(b - U*xn);

    % Check norm of residual for convergence
    normres = norm(b - A*xnp1);
    if (normres < tol)
      % Converged.
      x = xnp1;    
      itr = idx;
      return
    end
    
    % Didn't converge yet.  Push current value of x back and iterate again.
    xn = xnp1;
  end
  error('Did not converge')
end
