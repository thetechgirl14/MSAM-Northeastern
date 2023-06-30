function I = simpson2D(z, x, y)
    
    if size(z,1) ~= length(y) || size(z,2) ~= length(x)
        error('Input dimensions do not match');
    end
    
    if mod(length(x), 2) == 0 || mod(length(y), 2) == 0
        error('Lengths of x and y must be odd');
    end
    
    % Initializing weights matrix

    W = ones(size(z));
       
    W(1:2:end-1, 1:2:end-1) = 4;
    W(2:2:end, 1:2:end) = 4;
    W(1:2:end, 2:2:end) = 4;
    W(2:end-1, 2:end-1) = 8;
    W(1:2:end, 1:2:end) = 2;
    W(3:2:end-1, 3:2:end-1) = 4;
    W(2:2:end-1, 2:2:end-1) = 16;
    W(1, 1) = 1;
    W(1, end) = 1;
    W(end, 1) = 1;
    W(end, end) = 1;

    % Computing step sizes
    hx = x(2) - x(1);
    hy = y(2) - y(1);
    
    % Computing integral approximation
    I = hx * hy / 9 * sum(sum(W .* z));

end
