function test_mysin()
  % This runs the function mysin for inputs over a range, and
  % checks its return against that from MATLAB.   If the difference
  % is larger than 1 ULP, then it errors out.

  for x = -10:2:100
    tol = 1*eps(x);
    y_comp = mysin(x, tol);
    y_true = sin(x);
    diff = abs(y_comp - y_true);
    fprintf('x = %20.18e, y_comp = %20.18e, y_true = %20.18e, diff = %20.18e\n', x, y_comp, y_true, diff)
    if (diff > tol)
      error('Error is too large!!!\N')
    end
  end

  % If we get here, it's because all comparisons passed.
  fprintf('---  Test passed!  Success!  ----\n')

end