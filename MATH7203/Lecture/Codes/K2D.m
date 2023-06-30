function A = K2D(Ix, Jy)
  % This fcn creates the K2D matrix.  It is the Laplace operator
  % in 2D.  The inputs are:
  % Ix = number of grid points in x direction
  % Jy = number of grid points in y direction
  % The operator itself has sides of length Ix*Jy.
    
  N = Ix*Jy;

  % Create ones vector for convenience
  E1 = ones(Ix, 1);

  % Create D2 matrix
  % Matrix off-diag terms are -1
  % On-diag terms are 4
  doff = -1*E1;
  don = 4*E1;

  D2 = spdiags([doff, don, doff], [-1, 0, 1], Ix, Ix);

  % Waaay off diagonal terms are 1.
  In = -1*speye(Ix, Ix);

  % Create K2D matrix from D2 and In using kron.  This
  % replicates the individual matrices Jy times
  A = kron(eye(Jy), D2) + kron(diag(ones(1, Jy-1), -1), In) + kron(diag(ones(1, Jy-1), 1), In);

end
