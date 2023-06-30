function z = Jacobian(theta)
  global params
  l1 = params.l1;
  l2 = params.l2;
  x = params.x;
  y = params.y;

  z = zeros(2, 2);  % Create return as 2x2 matrix
  z(1, 1) = l2*sin(theta(1) + theta(2)) - l1*sin(theta(1));
  z(1, 2) = l2*sin(theta(1) + theta(2));
  z(2, 1) = -l2*cos(theta(1) + theta(2)) + l1*cos(theta(1));
  z(2, 2) = -l2*cos(theta(1) + theta(2));

end
