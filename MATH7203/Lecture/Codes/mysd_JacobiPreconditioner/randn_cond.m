function A = randn_cond( rows, cols, k0 )
% This function returns a random matrix A with condition 
% number k (within 10%)

% The algorithm is trivial: In a loop, generate a random matrix,
% then check the condition number.  If the cond is within the
% acceptable range, return it.  Otherwise, loop around and try 
% again.

  % Give 10% tolerance band for condition number.
  lowerlim = 0.9*k0;
  upperlim = 1.1*k0;

  for idx = 1:50000
      A = randn(rows, cols);
      k = cond(A);
      if ( (lowerlim < k) && (k < upperlim) )
          return
      end
  end
  error('Failed to generate matrix with this condition number')

end

