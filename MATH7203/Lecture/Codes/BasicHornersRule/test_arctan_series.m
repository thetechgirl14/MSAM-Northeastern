function test_arctan_series()
  
  xs = linspace(-0.98, 0.98, 9);
  
  for i=1:length(xs)
    x = xs(i);
    y = arctan_series(x);
    y_bad = arctan_series_bad(x);
    diff = y_bad - y;
    fprintf('x = %f, y = %e, y_bad = %e, diff = %e, ... ', x, y, y_bad, diff)

    err = x - tan(y);
    err_bad = x - tan(y_bad);
    fprintf('err = %e, err_bad = %e\n', err, err_bad)
    
  end
  
end
