function root = secant(f, x0, x1, tol)
  % This fcn implements root finding via secant method
  % Call like this:
  % f = @(x) x^3 - 2*x + 5*x -7
  % secant(f, 1, 3, 1e-5)

  % Initialize computation
  f1 = f(x1);  f0 = f(x0);

  % Plotting stuff
  close all
  figure(1)
  xn = linspace(x0, x1, 100);
  yn = f(xn);
  plot(xn, yn, 'b');
  xmin = min(x0, x1);
  xmax = max(x0, x1);
  fmin = min(f0, f1);
  fmax = max(f0, f1);
  axis([xmin, xmax, fmin, fmax])
  hold on
  plot([xmin, xmax], [0, 0], 'k')
  
  % Do root finding in a loop to prevent infinite loops from nonconvergence
  for i = 1:100

    % Plotting stuff
    myplot1 = plot([x0, x1], [f0, f1], 'r');
    myplot2 = plot(x0, f0, 'ro');
    myplot3 = plot(x1, f1, 'ro');
    pause()
    delete(myplot1)
    delete(myplot2)
    delete(myplot3)    
    
    % Do the actual computation
    s = (f1 - f0)/(x1 - x0);
    x2 = x1 - (f1/s);
    f2 = f(x2);
    fprintf('x0 = %f, f0 = %f, x1 = %f, f1 = %f, s = %f, x2 = %f \n', ...
	    x0, f0, x1, f1, s, x2);

    % Check if we're close enough to quit yet
    % First check if we found the root -- abs(f(x2)) < tol
    if abs(f2) < tol
      fprintf('Terminating after %d iterations because f(x2) < tol. \n', i)
      root = x2;
      return
    % Now let's see if x1 and x2 are close enough to quit
    elseif abs(x2 - x1) < tol
      fprintf('Terminating after %d iterations because abs(x2-x1) < tol. \n', i)
      root = x2;
      return
    else
      x0 = x1;  f0 = f1;  x1 = x2;  f1 = f2;
    end
  end  % end of for loop

  error('Terminated without convergence! \n')

end
