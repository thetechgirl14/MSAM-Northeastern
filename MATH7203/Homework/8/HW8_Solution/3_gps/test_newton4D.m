function test_newton4D()
  global params
  % Satellite data
  params.sat_pos = [1.2 2.3 0.2; -0.5 1.5 1.8; -1.7 0.8 1.3; 1.7 1.4 -0.5];
  params.sat_t = [5.8530; 14.7328; 4.5328; 5.9390];
  params.c = 0.047;

  % startpt = [0; 0; 0; 0];  
   startpt = [2; -4; -6; 1.5];  
  % startpt = [0.2; 1.3; 2.2; 0];

  theta = newton4D(@myfunction, @myjacobian, startpt, 1e-5);

  fprintf('GPS Co-ordinates are [%f, %f, %f] and Local Time is %f\n', theta(1), theta(2), theta(3), theta(4));
end