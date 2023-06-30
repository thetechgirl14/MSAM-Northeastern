function y = mysin(x, tol)
  % Computes sin by folding input into domain 0 <= x <= 2*pi
  % Then computes value using polynomial approximation

  % Initialize some constants.  Do this once instead of doing
  % it multiple times in the program in order to improve performance.
  piover2 = pi/2;
  pitimes2 = 2*pi;
  s = mod(x, pitimes2);

  % Do folding
  if (s < piover2)
    y = P(s, tol);
    return
  elseif (s < pi)
    y = P(pi-s, tol);
    return
  elseif (s < 3*piover2)
    y = -P(s-pi, tol);
    return
  elseif (s <  pitimes2)
    y = -P(pitimes2-s, tol);
    return
  else
    error('We failed!  x = %15.12e, s = %15.12e\n', x, s)
    y = nan;
    return
  end

end


function z = P(s, tol)
  % This is the core function which computes sin(x) in the 
  % fundamental domain as a polynomial
  sum = 1;
  sign = 1;
  term = 1;
  for p = 2:2:18
%    disp(p)
    denom = (p+1)*p;
    term = s*s*term/denom;
%    disp(term)
    sign = -sign;
    sum = sum + sign*term;
%    disp(s*sum)
    if (term < tol) 
      break
    end
  end
  z = s*sum;
  return
end
