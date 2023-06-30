function y = RK4(y0, N)
  % This function solves the differential equation
  % y' = f(y,t) using 4th order Runge-Kutta
  % It takes as inputs:
  % y0 = initial value of y
  % N = Number of points to compute

  global lambda;
  global alpha;
  global omega;
  global h;

  % create vector y
  y = zeros(1, N);
  t = 0;

  y(1) = y0;
  for n = 1:(N-1)
    k1 = h*f(y(n), t);
    k2 = h*f(y(n) + k1/2, t+h/2);
    k3 = h*f(y(n) + k2/2, t+h/2);
    k4 = h*f(y(n) + k3, t+h);
    y(n+1) = y(n) + (k1 + 2*k2 + 2*k3 + k4)/6;
    t = t+h;
  end

end
