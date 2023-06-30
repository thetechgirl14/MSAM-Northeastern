function dydt = f(y, t)

  global lambda;
  global alpha;
  global omega;

  % When to give fcn a kick
  T0 = 10;

%  if (abs(t-T0)<.1)
%    dydt = 5;  % Give function a kick
%  else
    dydt = -lambda*y + alpha*sin(omega*t);
%  end

end

