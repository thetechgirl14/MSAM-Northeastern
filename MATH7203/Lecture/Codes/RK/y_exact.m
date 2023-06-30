function y = y_exact(y0, N)

  global lambda;
  global alpha;
  global omega;
  global h;

disp(lambda)
disp(alpha)
disp(omega)
disp(h)


  % Coefficients used in exact solution
  A = (alpha*lambda)/(omega*omega + lambda*lambda);
  B = -(alpha*omega)/(omega*omega + lambda*lambda);
  C = y0 - B;

disp(A)
disp(B)
disp(C)

  % create vector y
  y = zeros(1, N);
  t = 0;

  % Solution
  for n = 1:N
    y(n) = C*exp(-lambda*t) + A*sin(omega*t) + B*cos(omega*t);
    t = t+h;
  end

end

