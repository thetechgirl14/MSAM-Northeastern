function TestRK2()
  % This function calls RK2 with the
  % variables needed to run it.

  global lambda;
  global alpha;
  global omega;
  global h;

  % Set up parameters in equation
  lambda = 1.5;
  alpha = .2;
  omega = 1;

  % Step size to use
  h = .5;

  % Length of time to compute
  Tmax = 20;

  % Number of points to compute
  N = Tmax/h;

  % Initial condition
  y0 = -1;

  % Time vector -- used in plotting
  t = linspace(0, h*N, N);

  % Computed solution using 2nd order Runge-Kutta
  y = RK2(y0, N);

  % Compute exact solution at higher point density
  h = h/10;
  N = Tmax/h;
  t1 = linspace(0, h*N, N);
  y_true = y_exact(y0, N);

  % Compute difference between exact solution and RK2
  d = y - y_true(1:10:N);

  figure
  plot(t, y, 'r+')
  hold on
  plot(t1, y_true)
  plot(t, d, 'b+')  % Blue dots are error

end
