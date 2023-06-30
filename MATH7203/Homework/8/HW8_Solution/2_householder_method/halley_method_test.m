% Find exact roots using fzero
syms x
T5_sym = symfun(16*x^5 - 20*x^3 + 5*x, x);
exact_roots = vpasolve(T5_sym == 0, x, [-1, 1]);

% Find roots using Halley's method
f = @T5;
df = @(x) 80*x^4 - 60*x^2 + 5;
ddf = @(x) 320*x^3 - 120*x;
tol = 1e-10;
maxiter = 1000;

for i = 1:length(exact_roots)
    x0 = exact_roots(i) + 0.1; % Starting point near the exact root
    root = HalleyMethod(f, df, ddf, x0, tol, maxiter);
    if (exact_roots(i) - root < tol)
        fprintf("Test Passed! \n")
    else
        fprint("Test Failed! \n")
    end
end

   
