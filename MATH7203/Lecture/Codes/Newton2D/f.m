function z = f(theta)
  global params
  l1 = params.l1;
  l2 = params.l2;
  x = params.x;
  y = params.y;

  z = zeros(2, 1);  % Create return as column vector
  z(1) = -l2*cos(theta(1) + theta(2)) + l1*cos(theta(1)) - x;
  z(2) = -l2*sin(theta(1) + theta(2)) + l1*sin(theta(1)) - y;

end
