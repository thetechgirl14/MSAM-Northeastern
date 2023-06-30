% Define the function y(t)
y = @(t) (t<=0).*exp(t) + (t>0).*exp(-t);

t = (-1:0.01:1);

y_true = y(t);

M = [0,1,5,20];
rms_error = zeros(1,length(M));

for i = 1:length(M)
    y_approx = zeros(size(t));
    a0 = 2.*(1 - 1/exp(1));
    y_approx = y_approx + a0/2;
    for n=1:M(i)
        bn = 2*(pi*n*sin(pi*n)-cos(pi*n)+exp(1))/(exp(1)*pi^2*n^2+exp(1));    
        y_approx = y_approx + (cos(n*pi*t)*bn);
    end
    
    plot(t, y_approx, '-', t, y_true, '.');
    legend('m = 0', 'm = 1','m = 5', 'm = 20','Original function');
    hold on

    rms_error(i) = sqrt(mean((y_true - y_approx).^2));
  
end
figure,
plot(M, rms_error,'o');
xlabel('M (highest order term summed)');
ylabel('RMS error');
    




