function dydt = f(y, t)

  global m;
  global k;
  global a;
  global b;
  
  dydt = [y(2); (-k*y(1) + a*y(2) - b*(y(2))^3)/m];

end