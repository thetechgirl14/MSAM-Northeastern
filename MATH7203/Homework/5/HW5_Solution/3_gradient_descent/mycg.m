function idx = mycg( A, b, tol )
  % This is my implementation of the basic CG algorithm.

  % Sanity check
  if any( any(abs(A-A')>tol) )
    error('Matrix must be symmetric positive definite!');
  end

  % Initialize calc
  xn = zeros(size(b));  % Initial first guess 
  rn = b;               % b - A*x with x0 = zeros.
  dn = rn;

  for idx = 1:200
    % Compute A*d product -- do only one matmul
    z = A*dn;

    % Update alpha
    alphan = (rn'*rn)/(dn'*z);
    
    % Take step
    xnp1 = xn + alphan*dn;
    
    % Update residual
    rnp1 = b - A*xnp1;
    %disp('-------------------')
    % fprintf('iteration %d, norm(rnp1) = %e\n', idx, norm(rnp1))
    
    % Check for convergence: residual < tol
    if (norm(rnp1) < tol)
      fprintf(' Niter = %d ', idx)
      return 
    end

    % Compute updated beta
    betan = (rnp1'*rnp1)/(rn'*rn);

    % Compute new step direction
    dnp1 = rnp1 + betan*dn;

    % Now push all n+1 values to n, then loop again.
    dn = dnp1;
    rn = rnp1;
    xn = xnp1;

  end
  error('Failed to converge!')

end

