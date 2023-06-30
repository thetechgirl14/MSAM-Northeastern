function [A, Ds, Vs] = analyze_stocks()
  % This fcn perforems PCA on a set of stocks.  It returns
  % the normalized and zero-centered stock price data A
  % and the sorted eigenvectors and eigenvalues.
  % It makes a bunch of plots showing
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
  
  % Now create covariance matrix 
  N = size(A, 2);
  Q = A*A'/N;
  
  % Do eigenvalue decomposition
  [V,D] = eig(Q);

  % Sort eigenvalues in decreasing order
  [Ds, idx]=sort(diag(D), 1, 'descend');
  % Rearrange eigenvectors to match eigenvalues.
  for cnt=1:length(Ds)
    Vs(:,cnt)=V(:,idx(cnt));
  end 
  fprintf('First eigenvector = \n')
  disp(Vs(:, 1))
  fprintf('Second eigenvector = \n')
  disp(Vs(:, 2))
  fprintf('Third eigenvector = \n')
  disp(Vs(:, 3))
  
  % Now plot eigenaxes
  e1 = horzcat([0;0;0], Vs(:,1))';
  plot3(e1(:,1), e1(:,2), e1(:,3), 'r')

  e2 = horzcat([0;0;0], Vs(:,2))';
  plot3(e2(:,1), e2(:,2), e2(:,3), 'b')

  e3 = horzcat([0;0;0], Vs(:,3))';
  plot3(e3(:,1), e3(:,2), e3(:,3), 'g')

  fprintf('Sorted eigenvalues Ds = \n')
  disp(Ds)
  
end
