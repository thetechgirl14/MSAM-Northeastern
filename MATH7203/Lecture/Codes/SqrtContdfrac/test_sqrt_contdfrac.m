function test_sqrt_contdfrac()
  % This is tester for sqrt_contdfrac.  It throws a bunch
  % of random numbers at sqrt_contdfrac, takes the result,
  % squares it, and compares it against the original number.
    
  pass = 0;
  fail = 0;
  tol = 1e-7;
    
  for cnt = 1:10
    fprintf('---------------------------------------------------\n')    
    xorig = 100*rand();  % Generate random number between 0 & 100
    y = sqrt_contdfrac(xorig);
    xcomp = y*y;
    fprintf('Input x = %e, computed sqrt(x)^2 = %e ....', xorig, xcomp)
    diff = abs(xorig - xcomp);
    if (diff < tol)
      % Success -- test passed.
      fprintf('... Test passed.  abs(xorig-xcomp) = %e\n', diff)
      pass = pass + 1;
    else 
      % diff larger than tol -- test failed.      
      fprintf('... Test failed.  abs(xorig-xcomp) = %e\n', diff)
      fail = fail + 1;
    end
    
  end
  fprintf('=====================================================\n')
  fprintf('At end, pass = %d, fail = %d\n', pass, fail)
  
end