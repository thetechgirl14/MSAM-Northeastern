function test_newton2D()
  global params
  params.l1 = 3;
  params.l2 = 3;
  params.x = 4;
  params.y = 4;

  startpt = [pi/2; pi/2];  % Converges to [1.1252; 2.4619]
%  startpt = [.1; .1];  % Converges to weird place after many iterations.
%  startpt = [2; 1];


  theta = newton2D(@f, @Jacobian, startpt, 1e-5);

  fprintf('theta1 = %f rad,  theta2 = %f rad\n', theta(1), theta(2));
  fprintf('theta1 = %f deg,  theta2 = %f deg\n', rad2deg(theta(1)), rad2deg(theta(2)));

end

function thetaout = rad2deg(thetain)
  thetaout = (thetain/pi)*180;
end

