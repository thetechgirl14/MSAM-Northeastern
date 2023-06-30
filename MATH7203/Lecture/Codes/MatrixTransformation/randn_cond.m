function A = randn_cond( rows, cols, k0 )
  % This function returns a random matrix A with condition 
  % number k0.  It uses the SVD method.

  % Create random matrix of correct size.
  A = randn(rows, cols);

  % Do SVD to extract diagonal elements.
  [U, S, V] = svd(A);

  % Create vector of new elements to put on diagonal.
  N = min(size(S));
  lambda = linspace(1, k0, N);

  % Now get index into diagonal parts, and then set 
  % those elements to diag element vector lambda.
  idx = find(eye(size(S))==1);
  S(idx) = lambda;

  % Regen A and return.
  A = U*S*V';

end

