function result = Gauss_Chebyshev_Quadrature(N)
    
    % Defining the integrand as a function handle
    f = @(x) atan(x)./x;

    res = 0;
    for i = 1:N

        t = cos(((2*i-1)*pi)/(2*N));
        w = pi/N;

        res = res + w*f(t);
    end
    result = res;
end
