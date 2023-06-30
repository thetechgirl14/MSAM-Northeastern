function theta = newton4D(f, Jacobian, theta0, tol)
  % This fcn implements 4D root finding via Newton's method
  % f is a function handle, f takes a vector input and returns a vector output
  % Jacobian is a function handle to the Jacobian.  Jacobian takes a vector input (x, y, z, tlocal)
  % and returns the Jacobian matrix.
  % Theta0 is the initial guess
  % tol is the desired tolerance.

  % Do root finding in a loop to prevent infinite loops
  % from nonconvergence
  theta = theta0;
  for i = 1:25
    fnp1 = f(theta);
    Jnp1 = Jacobian(theta);
    delta = -Jnp1\fnp1;
    theta = theta+delta;
    fprintf('delta = [%16.12f, %16.12f, %16.12f, %16.12f]  theta = [%16.12f, %16.12f, %16.12f, %16.12f]\n', delta(1), delta(2), delta(3), delta(4), theta(1), theta(2), theta(3), theta(4));

    % Check if we're close enough to quit yet
    % Check if delta is less than tol
    if norm(delta) < tol    
      fprintf('Terminating after %d iterations because norm(delta) < tol.\n', i)
      return
    end

  end  % end of for loop

  fprintf('Terminated without convergence!\n')
  theta = [nan, nan, nan, nan];

end