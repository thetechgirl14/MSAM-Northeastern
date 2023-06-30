function y = arctan_series_bad(x)
  % This sums the first M terms of the sum
  % arctan(x) = x - x^3/3 + x^5/5 - x^7/7 + ...  
  % the naive way.
    
  % Initialize computation
  y = 0;   % Running sum variable
  M = 24;  % Highest order term in sum.

  % Now compute terms inside loop.
  for n = 1:2:M
    s = power(-1, (n-1)/2);  % Sign
    t = s*power(x, n)/n;     % This term
    y = y + t;
  end
end

