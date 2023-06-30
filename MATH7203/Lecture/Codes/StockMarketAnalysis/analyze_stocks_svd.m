function [A, Q] = analyze_stocks_svd()
  % This fcn perforems PCA on a set of stocks.  It returns
  % the normalized and zero-centered stock price data
  % and the covariance matrix.  It makes a bunch of plots showing
  % the structure of the data.

  c = 'rbgvk';
  
  % Read in stock price histories as matrix A.
  % Elapsed time correspond to rows, different
  % stocks are the columns.  T is a vector of
  % elapsed days.
  [T, A] = create_stock_matrix();
  A = A';  % Must make each row a different stock,
           % elapsed time corresponds to increasing
	   % col index.  This is to match convention
	   % used in PCA.
  
  % Make plot of raw price data.
  num_stocks = size(A, 1);
  figure(1)
  semilogy(T, A(1,:), c(1))  
  hold on
  for idx = 2:num_stocks
    semilogy(T, A(idx,:), c(idx))
  end
  title('Raw stock price data')
  xlabel('Days')
  ylabel('Closing price')
  
  % Normalize price data and make it zero-centered
  % i.e. subtract off mean and normalize it.
  for idx = 1:num_stocks
    S = A(idx, :);
    S = S-mean(S);
    peak = max(abs(S));
    S = S/peak;
    A(idx, :) = S;
  end
  
  % Plot zero-centered, normalized data
  figure(2)
  hold on
  for idx = 1:num_stocks
    plot(T, A(idx, :), c(idx))
  end
  title('Centered and normalized stock price data')  
  xlabel('Days')
  ylabel('Closing price')

  % 3D scatter plot of data.
  figure(3)
  scatter3(A(1,:), A(2,:), A(3,:), 'bo')
  hold on
  axis square  
  
  % Now perform SVD
  [U, S, V] = svd(A);
  fprintf('First eigenvector = \n')
  disp(U(:, 1))
  fprintf('Second eigenvector = \n')
  disp(U(:, 2))
  fprintf('Third eigenvector = \n')
  disp(U(:, 3))
  
  % Now plot eigenaxes
  e1 = horzcat([0;0;0], U(:,1))';
  plot3(e1(:,1), e1(:,2), e1(:,3), 'r')

  e2 = horzcat([0;0;0], U(:,2))';
  plot3(e2(:,1), e2(:,2), e2(:,3), 'b')

  e3 = horzcat([0;0;0], U(:,3))';
  plot3(e3(:,1), e3(:,2), e3(:,3), 'g')

  fprintf('Sorted singular values = \n')
  disp(diag(S))
  
end
