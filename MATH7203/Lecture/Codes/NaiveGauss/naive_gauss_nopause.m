function x = naive_gauss_nopause(A,b);
  % Gaussian elimination -- Original function found on Stackoverflow:
  % http://stackoverflow.com/questions/9028701/gaussian-elimination-in-matlab
  % This verision edited for Numerical Analysis 1 class.

  % This fcn solves the equation A*x = b, and returns x.  Inputs are A, b.
  % This version does no pivoting.

  % Get length of input vector b.
  n = length(b); 

  % preallocate output x vector.
  x = zeros(n,1);

  % Perform forward elimination to create triangular matrix.
  for k=1:n-1     % Iterate over pivots
    for i=k+1:n   % Iterate over rows
      xmult = A(i,k)/A(k,k);  % Divide by pivot
      for j=1:n     % Third inner loop over cols -- algorithm is O(N^3)
        A(i,j) = A(i,j)-xmult*A(k,j);
      end
      b(i) = b(i)-xmult*b(k);
    end
  end
  
  % Now do back substitution to get x.
  x(n) = b(n)/A(n,n);
  for i=n-1:-1:1
    sum = b(i);
    for j=i+1:n
      sum = sum-A(i,j)*x(j);
    end
    x(i) = sum/A(i,i);
  end

end

