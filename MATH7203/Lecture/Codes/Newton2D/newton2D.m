function theta = newton2D(f, Jacobian, theta0, tol)
  % This fcn implements 2D root finding via Newton's method
  % fn is a function handle, fn takes a vector input and returns a vector output
  % Jn is a function handle to the Jacobian.  Jn takes a vector input (theta1, theta2)
  % and returns the Jacobian matrix.
  % Theta0 is the initial guess
  % tol is the desired tolerance.

  % Needed to pass any parameters to f and df
  global params

  % Do root finding in a loop to prevent infinite loops
  % from nonconvergence
  theta = theta0;
  for i = 1:25
    fnp1 = f(theta);
    Jnp1 = Jacobian(theta);
    delta = -Jnp1\fnp1;
    theta = theta+delta;
    fprintf('delta = [%16.12f, %16.12f]  theta = [%16.12f, %16.12f]\n', delta(1), delta(2), theta(1), theta(2));

    % Check if we're close enough to quit yet
    % Check if delta is less than tol
    if norm(delta) < tol    
      fprintf('Terminating after %d iterations because norm(delta) < tol.\n', i)
      return
    end

  end  % end of for loop

fprintf('Terminated without convergence!\n')
theta = [nan, nan];

end
