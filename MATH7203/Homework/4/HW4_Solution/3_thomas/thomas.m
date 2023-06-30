function x = thomas(a, c, b, d)
    % thomas solves a tridiagonal system of linear equations using the Thomas algorithm
    % x = THOMAS(a, c, b, d) solves the tridiagonal system Ax = d, where A is a tridiagonal
    % matrix with subdiagonal elements stored in the vector a, diagonal elements stored in the
    % vector c, and superdiagonal elements stored in the vector b.
    
    n = length(c);
    
    % Forward elimination
    
    for i = 2:n
        m = a(i-1) / c(i-1);
        c(i) = c(i) - m * b(i-1);
        d(i) = d(i) - m * d(i-1);
    end
    
    % Backward substitution
    
    x = zeros(n, 1);
    x(n) = d(n) / c(n);
    fprintf('After backsubst %d,\nx = \n', n)
    disp(x)
    pause()
    for i = n-1:-1:1
        x(i) = (d(i) - b(i) * x(i+1)) / c(i);
        fprintf('After backsubst %d,\nx = \n', n)
        disp(x)
        pause() 
    end

end