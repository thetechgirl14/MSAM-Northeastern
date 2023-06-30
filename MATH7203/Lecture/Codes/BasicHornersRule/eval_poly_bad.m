function y = eval_poly_bad(a, x)
  % a is vector of coefficients
  % x is scalar where we want to evaluate the poly

  % This is the bad way to compute the poly!

  % polyvals naming convention looks like this;
  % y(x) = a_n+1 + a_n*x + a_n-1*x^2 + a_n-2*x^3 + ... + a1*x^n

  % Initialize computation
  N = length(a);
  y = a(N);

  % Compute poly in loop
  for n = 1:N-1
    y = y + a(N-n)*power(x,n);
  end
  % disp(y)

  % Display built-in fcn result
  % disp(polyval(a, x))

end
