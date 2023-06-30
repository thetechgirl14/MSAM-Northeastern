% %The program to plot the polynomial p(x) = (x-1)^7 and binomial expansion
% of p(x)
delta = 1.2e-2;
x = 1-delta:0.0001:1+delta;
p = (x-1).^7;
expanded_p = x.^7 - 7*x.^6 + 21*x.^5 - 35*x.^4 + 35*x.^3 - 21*x.^2 + 7*x - 1;
plot(x,p)
hold on
plot(x,expanded_p)
legend('Original Polynomial', 'Expanded Polynomial')
