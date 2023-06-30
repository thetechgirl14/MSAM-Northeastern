function y = arctan_series(x)
  % This sums the first M terms of the sum
  % arctan(x) = x - x^3/3 + x^5/5 - x^7/7 + ...  
  % using Horner's method.
    
  % Initialize computation
  y = x;  % First term
  s = 1;  % Sign
  t = x;  % This term
  M = 24; % Higest order term in sum.
  
  % Now compute terms inside loop.
  % Start at third term since the above initialization
  % is already the first term.
  for n = 3:2:M
    s = -s;
    t = t*x*x;   % This term
    y = y + s*t/n;
  end
end

