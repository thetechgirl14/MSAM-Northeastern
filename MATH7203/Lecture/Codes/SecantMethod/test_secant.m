function test_secant()
  % This fcn tests my bisection method root finder.

  % Define fcn whose roots I want to find.  Define it using
  % an anonymous function.  Roots should be 3, 5, 7, 9.
  f = @(x) (x-3).*(x-5).*(x-7).*(x-9);

  % Initial endpoints of search -- should find root at 3.
  a = 2;
  b = 3.9;
  r_exp = 3;

  % Tolerance
  tol = 1e-5;

  r_comp = secant_method(f, a, b, tol);
  fprintf('====> Final answer = %f\n', r_comp)

  if (abs(r_comp - r_exp) > tol)
    fprintf('Failure!\n')
  else
    fprintf('Success!\n')
  end

end
