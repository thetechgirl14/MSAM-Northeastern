function root = HalleyMethod(f, df, ddf, x0, tol, maxiter)
% Implements Halley's method to find roots of function f
% f: function handle for f(x)
% df: function handle for f'(x)
% ddf: function handle for f''(x)
% x0: initial guess
% tol: tolerance for stopping criterion
% maxiter: maximum number of iterations
% returns: root found by Halley's method

x = x0;
for i = 1:maxiter
    fx = f(x);
    dfx = df(x);
    ddfx = ddf(x);
    num = 2*fx*dfx;
    denom = 2*(dfx)^2 - fx*ddfx;
    delta = num/denom;
    x = x - delta;
    if abs(delta) < tol
        root = x;
        return
    end
end
error('Halley method failed to converge');
end
