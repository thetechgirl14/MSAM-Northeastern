for N = 3:2:9
    fprintf('*********   Testing [%d, %d] matrix   ************\n', N, N)
    a = 10*randn(N-1, 1);
    b = 10*randn(N-1, 1);
    c = 10*randn(N, 1);
    d = 10*randn(N, 1);

    A = diag(a, -1) + diag(b, 1) + diag(c, 0);
    
    disp(A)

    % Solve the system using the Thomas algorithm
    x = thomas(a, c, b, d);
    
    % Check if the solution is correct
    residual = d - A*x;
    tolerance = 1e-6;
    if all(abs(residual) < tolerance)
        disp('Solution is correct within the tolerance')
        disp(tolerance)
    else
        disp('Solution is incorrect.')
    end
end


