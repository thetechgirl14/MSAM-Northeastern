function idx = mysd( A, b, tol )
  % My version of the steepest descent (gradient descent)
  % algorithm.
  %
  % Inputs:
  % A -- matrix
  % b -- known vector on RHS of Ax = b
  % tol -- stopping tolerance.
  %
  % Outputs:
  % xnp1 -- computed solution vector to Ax = b


  % Sanity check that matrix is symmetric (otherwise gradient descent might
  % not converge).
%  if any( any(A ~= A') )
%    error('Matrix must be symmetric positive definite!');
%  end

  % Starting values
  xn = zeros(size(b));
  rn = b;

  % Do this in for loop -- not while loop -- since it might not converge.
  for idx = 1:1000000
    alphan = (rn'*rn) / (rn'*A*rn);
    xnp1 = xn - alphan*rn;
    
    rnp1 = A*xnp1 - b;
    % fprintf('iteration %d, norm(rkp1) = %e, tol = %e\n', idx, norm(rnp1), tol)
    if (norm(rnp1) < tol)
      fprintf(' Niter = %d ', idx)
      return
    end
    
    % Move variables from n+1 to n prior to next loop.
    % Note this is bad practice since it uses extra memory for
    % potentially large objects.  However, it makes it more clear
    % what is going on.
    xn = xnp1;
    rn = rnp1;

  end
  
  % If we get here it's because the algorithm didn't converge.
  error('mysd failed to converge!');

end

