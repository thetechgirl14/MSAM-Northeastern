N = 2:21;
cn = zeros(1, length(N));
rn = zeros(1, length(N));

for i = 1:length(N)
    n = N(i);
    x0 = (1:n).';
    Vn = vandermonde(x0);
    cn(i) = cond_num(Vn);
    b = Vn*x0;
    xc = Vn\b;
    rn(i) = norm(x0 - xc);
end

figure,
semilogy(N, cn, 'o');
hold on
semilogy(N, rn, 'x');
legend('Condition Num','Residual');
xlabel('Matrix Dimension N');
ylabel('Value');
title('Condition Number and Norm vs Matrix Order');
hold off