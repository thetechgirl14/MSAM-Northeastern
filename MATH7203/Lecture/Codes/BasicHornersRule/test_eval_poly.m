function test_eval_poly()
  % This evaluates y = (x - 1)^n using a polynomial expansion.
  % Then it compares the result to (x-1)^n.
    
  % (x-1)^n coefficients drawn from Pascal's triangle.
  %a = [1 -7 21 -35 35 -21 7 -1];
  a = [1
       -11
       55
       -165
       330
       -462
       462
       -330
       165
       -55
       11
       -1];
  n = length(a)-1;  % Degree of poly depends upon number of coeffs 
  
  x = 12.345;  % Choose point at which to evaluate poly
  tic
  y_bad = eval_poly_bad(a, x)
  t_bad = toc;
  
  tic
  y_good = eval_poly_good(a, x)
  t_good = toc;
  
  y_true = (x-1)^n;
  diff_bad = y_bad - y_true;
  diff_good = y_good - y_true;

  fprintf('y_bad  = %18.16e, time bad  = %e, diff_bad  = %18.16e\n',  ...
	  y_bad, t_bad, diff_bad);
  fprintf('y_good = %18.16e, time good = %e, diff_good = %18.16e\n', ...
	  y_good, t_good, diff_good);

end
