%The program to plot the polynomial p(x) = (x-1)^7 
delta = 1.2e-2;
x = 1-delta:0.0001:1+delta;
p = (x-1).^7;
plot(x,p)