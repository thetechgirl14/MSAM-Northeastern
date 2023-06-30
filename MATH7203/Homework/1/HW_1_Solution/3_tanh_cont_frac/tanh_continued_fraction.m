function y = tanh_continued_fraction(x)
    %a0 = x;
    b0 = 0;
    a1 = x;
    b1 = 1;
    %a2 = x^2;
    %b2 = 5;
    for i = 2:1000
        ai = x^2;
        bi = 2*i - 1;
        a2 = b2*a3 + a2*b3;
        b2 = b2*b3 + a2*a3;
        a1 = b1*a2 + a1*b2;
        b1 = b1*b2 + a1*a2;
        a0 = b0*a1 + a0*b1;
        b0 = b0*b1 + a0*a1;
    end
    y = a0/b0;
end

