function time_naive_gauss()
  % This fcn times the impl of naive gauss
  close all
  
  % This should turn off the JIT so I get O(N^3) timing.
  % Alternately, run this program in Octave.
  feature accel off

  % Ns = [3, 3, 5, 10, 20, 30, 50, 100, 200, 500, 1000]';
  Ns = [3, 3, 5, 5, 10, 20, 30, 30, 50, 50, 100, 100, 200, 200, 200, 300, 450, 700 1000]';  
  % Col vector to hold timing results.
  Ts = zeros(length(Ns), 1);
  
  % Time matrices of sizes given in Ns.
  for idx = 1:length(Ns)
    N = Ns(idx);
    fprintf('*********   Timing [%d, %d] matrix   ************\n', N, N)

    tic()
    for cnt = 1:10
      A = 10*randn(N,N);
      b = 10*randn(N, 1);
      xcomp = naive_gauss_nopause(A, b);   % Compute using my impl of Gauss elim.
    end
    Ts(idx) = toc();
    
  end
  
  loglog(Ns, Ts, 'bo')
  xlabel('Matrix dimension N')
  ylabel('Runtime in seconds')
  
  % Fit line to log(x), log(y).  Slope is O(gauss).
  % Skip first 6 points since we only want asymptotic behavior
  Nstart = 10;
  x = log(Ns);
  y = log(Ts);
  p = polyfit(x(Nstart:end), y(Nstart:end), 1);  
  fprintf('************************************\n')  
  fprintf('Naive Gauss is O(%1.3f)\n', p(1))

end
