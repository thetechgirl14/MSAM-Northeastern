function [T, A] = create_stock_matrix()
  % This fcn reads in a selected set of stock price
  % histories, and returns the set of stock price
  % histories as a matrix.  This program returns
  % each stock as a colum vector, where time increases
  % with increasing row index.
    
  % Stocks are chosen to be of two types:  software/internet and
  % old-line industrials.
%  stocks = {'AAPL.dat', 'GOOG.dat', 'MSFT.dat', 'YHOO.dat', ...
%	    'GE.dat', 'MMM.dat', 'X.dat', 'DOW.dat'};
%  stocks = {'AAPL.dat', 'MSFT.dat', 'GOOG.dat'}  
  stocks = {'YHOO.dat', 'MSFT.dat', 'GOOG.dat'}    
  num_stocks = length(stocks);

  % Initialize time elapsed vector.
  T = [];

  % First we read in all stock price files.  Since the data are not
  % perfect, the histories have slight inperfections.  In particular,
  % the closing price is missing for a couple of stocks for a couple
  % of days.  Therefore, I first find the superset of all recorded
  % days.
  for idx = 1:num_stocks
    stock_name = stocks{idx};
    fprintf('Reading file %s ....', stock_name);
    S = csvread(stock_name);
    disp(size(S))
    T = union(T, S(:,1));
  end

  % Now we have all recorded days.  Now read in price data and stick
  % it into matrix
  num_days = length(T);
  A = -999*ones(num_days, num_stocks);
  for stock_idx = 1:num_stocks
    stock_name = stocks{stock_idx};
    % fprintf('Reading file %s ....\n', stock_name);
    S = csvread(stock_name);
    % Now insert into A matrix.
    day_idx_s = 1;
    for day_idx_t = 1:num_days
      if (T(day_idx_t) == S(day_idx_s, 1))
	A(day_idx_t, stock_idx) = S(day_idx_s, 2);
	day_idx_s = day_idx_s+1;
      end
    end
  end
  
  % Now clean up elements which weren't loaded.  They are labeled
  % with a price of -999.  For each missing data element, I just
  % assign the value of the previous element to that point.
  idx = find(A == -999);
  %fprintf('Backfilling idx = ')
  %disp(idx)
  A(idx) = A(idx-1);
  
end
