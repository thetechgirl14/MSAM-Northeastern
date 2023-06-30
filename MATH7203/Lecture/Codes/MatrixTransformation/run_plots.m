function run_plots()
  % Creates random square matrix
  % with random condition number, then plots the associated
  % surface and contour

  close all;

  k0 = 5*rand();
  r = 2;
  c = 2;
  B = randn_cond( r, c, k0 );
  A = B+B';

  lambda = eigs(A);

  figure(1)
  plot_surface(A);

  figure(2)
  plot_contour(A);

  fprintf('Matrix eigenvalues = \n')
  disp(lambda)
end
