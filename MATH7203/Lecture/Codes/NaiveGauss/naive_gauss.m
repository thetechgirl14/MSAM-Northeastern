function x = naive_gauss(A,b);
  % Gaussian elimination -- Original function found on Stackoverflow:
  % http://stackoverflow.com/questions/9028701/gaussian-elimination-in-matlab
  % This verision edited for Numerical Analysis 1 class.

  % This fcn solves the equation A*x = b, and returns x.  Inputs are A, b.
  % This version does no pivoting.

  % Get length of input vector b.
  n = length(b); 

  % preallocate output x vector.
  x = zeros(n,1);

  fprintf('At start,\nA = \n')
  disp(A)
  fprintf('b = \n')
  disp(b)
  fprintf('Hit return to continue....\n')
  pause()

  % Perform forward elimination to create triangular matrix.
  fprintf('-------  Forward elimination  -------\n')
  for k=1:n-1     % Iterate over pivots
    for i=k+1:n   % Iterate over rows
      xmult = A(i,k)/A(k,k);  % Divide by pivot
      for j=1:n     % Third inner loop over cols -- algorithm is O(N^3)
        A(i,j) = A(i,j)-xmult*A(k,j);
      end
      b(i) = b(i)-xmult*b(k);
    end
    fprintf('After iteration %d,\nA = \n', k)
    disp(A)
    fprintf('b = \n')
    disp(b)
    pause()
  end
  
  % Now do back substitution to get x.
  fprintf('-------  Backward substitution  -------\n')
  x(n) = b(n)/A(n,n);
  fprintf('After backsubst %d,\nx = \n', n)
  disp(x)
  pause()  
  for i=n-1:-1:1
    sum = b(i);
    for j=i+1:n
      sum = sum-A(i,j)*x(j);
    end
    x(i) = sum/A(i,i);
    fprintf('After backsubst %d,\nx = \n', i)
    disp(x)
    pause()
  end

  fprintf('Done!  x = \n')
  disp(x)

end

