function squish_data_matrix(A, Ds, Vs)
  % Given a 3D input data matrix, A, and PCA eigenvalues &
  % eigenvectors, squish out dimension 3
    
  % A data is in rows.  size(A) = [3, M]
  % Vs eigenvectors are in cols.
  % B data in rows.  size(B) = [2,M]  
  
  % Create matrix to hold projected data.
  B = zeros(2, size(A,2));  % Projected space

  disp('size(A) = ')
  size(A)

  disp('size(Vs) = ')
  size(Vs)
  
  disp('size(B) = ')  
  size(B)

  % Create projection matrix from eigenvectors
  VsT = Vs';
  P = VsT(1:2,:);

  % This does projection using the projection matrix P
  for col = 1:size(A,2)
    B(:, col) = P*A(:,col);
  end

  % Now perform rotation by angle theta to orient data in same
  % way as obtained in 3D plot.  This is because Matlab's 3D
  % plotting stuff doesn't give me arbitrary rotations -- I 
  % must rotate my data in B to match what I get from Matlab

  % 2D Rotation matrix 
  theta = -120;   % Rotation angle to set
  R = [cosd(theta) sind(theta); -sind(theta) cosd(theta)];
  for col=1:size(A,2)
    B(:,col) = R*B(:,col);
  end
  
  figure(4)
  plot(B(1,:), B(2,:), 'bo')
  
end
