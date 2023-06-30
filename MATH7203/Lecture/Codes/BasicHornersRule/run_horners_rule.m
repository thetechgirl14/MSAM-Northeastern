% This demonstrates evaluation of a quintic polynomial using
% term-by-term eval (bad) and using Horner's rule (good).

% The poly to eval is y = 12x^5 - 16x^4 + 23x^3 - 53x^2 + 121x - 412

% x values to try
xs = [-1e8, -1e6, -1e4, -100, -10, -1, 1, 10, 100, 1e4, 1e6, 1e8];

for i = 1:length(xs)
  x = xs(i);
  % Note that I put the sign on the numerical coeff itself.
  y_good = -412 + x*(121 + x*(-53 + x*(23 + x*(-16 + x*(12)))));
  y_bad = 12*x^5 - 16*x^4 + 23*x^3 - 53*x^2 + 121*x - 412;
  diff = y_bad - y_good;
  fprintf('x = %e, y_good = %18.16e, y_bad = %18.16e, diff = %e \n', x, y_good, y_bad, diff)
end

