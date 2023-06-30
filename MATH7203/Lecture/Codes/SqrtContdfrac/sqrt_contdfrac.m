function yn = sqrt_contdfrac(n)
  % sqrt(n) = 1 + ((n-1)/(2 + ((n-1)/(2 + ... ))))
    
  % Following prescription in Numerical Recipies
  % b = 1
  % a = (n-1)

  % Initialize computation
  a = n-1;
  b0 = 1;
  b = 2;

  Ajm2 = 1;
  Bjm2 = 0;
  Ajm1 = b0;
  Bjm1 = 1;

  % Previous value and stopping tolerance -- used to know
  % when we are close enough to return.
  ynm1 = 0;
  tol = 1e-8;  % Stopping tolerance.
  
  % Note I use a for loop here, not a while loop.  While loops
  % can get stuck in infinite loops.
  for j = 1:500
    Aj = b*Ajm1 + a*Ajm2;
    Bj = b*Bjm1 + a*Bjm2;
    yn = Aj/Bj;
    diff = yn - ynm1;     % Compute difference to know if I am converging
    %fprintf('j = %f, yn = %16.13f, diff = %16.13f\n', j, yn, diff);

    if (abs(diff) < tol)
      fprintf('sqrt_contdfrac converged in %d iterations, result = %f\n', j, yn)
      return
    end
    
    % Move values back in preparation for next loop iteration.
    ynm1 = yn;
    
    Ajm2 = Ajm1;
    Bjm2 = Bjm1;
    Ajm1 = Aj;
    Bjm1 = Bj;
  end
  error('sqrt_contdfrac failed to converge')

end
