function y = eval_poly_good(a, x)
  % a is vector of coefficients
  % x is scalar where we want to evaluate the poly

  % polyvals naming convention looks like this;
  % y(x) = a_n+1 + x(a_n + x(a_n-1 + x(a_n-2 + ... x(a1) )))
  % Example: n=4
  % a_5 + x(a_4 + x(a_3 + x(a_2 + x(a1))))
  % Each iteration computes stuff inside parentheses.

  % Initialize computation
  y = a(1);

  % Compute remainder of poly in loop.
  for n = 2:length(a)
    % fprintf('n = %d, a(n) = %f\n', n, a(n));
    y = a(n) + x*y;
  end
  % disp(y)

  % Display Matlab built-in fcn result
  % disp(polyval(a, x))

end
