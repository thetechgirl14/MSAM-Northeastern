function y = tanh_taylor(x)
    piover2 = pi/2;
    if abs(x) >= piover2
        fprintf("Error: x must be in the range [-pi/2, pi/2]\n");
    else
        y = zeros(1,17);
        an = zeros(1,17);
        y(1) = x; 
        an(1) = 1;
        sum = x;
        a = zeros(1,17);
        b = zeros(1,17); 
        c = zeros(1,17);
        a(1) = 16;
        b(1) = 4;
        c(1) = 2;
        for i = 2:17
            a(i) = 16.*a(i-1);
            b(i) = 4.*b(i-1); 
            c(i) = (2.*i).*((2.*i) - 1).*c(i-1);
            an(i) = ((a(i) - b(i))/c(i));
            an(i)= mybernoulli(2*i).*an(i);
            y(i) = y(i-1).*x.*x.*an(i)/an(i-1);
            sum = sum + y(i);
            
        end
        y = sum;
    end
end
