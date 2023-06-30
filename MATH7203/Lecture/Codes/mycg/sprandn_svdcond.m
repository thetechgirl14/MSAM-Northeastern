function A = sprandn_svdcond( rows, cols, k0 )
  % This function returns a random matrix A with condition 
  % number k0
  %
  % The algorithm is simple:
  % 1.  Create random matrix B.
  % 2.  [U,S,V] = svd(B)
  % 3.  S = linspace(1, k0, min(rows, cols)
  % 4.  A = U*S*V'

  B = 100*sprandn(rows, cols, .2);
  N = max(rows, cols);
  [U, S, V] = svds(B, N);
  S = linspace(1, k0, min(rows, cols));
  A = U*diag(S)*V';

end

