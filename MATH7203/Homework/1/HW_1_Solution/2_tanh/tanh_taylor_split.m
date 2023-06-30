function y = tanh_taylor_split(x)
    threshold = 0.9;
    if abs(x) < threshold
        y = tanh_taylor(x);
    else
        u = x / 2;
        v = x / 2;
        y = (tanh_taylor(u) + tanh_taylor(v)) / (1 + tanh_taylor(u) * tanh_taylor(v));
    end
end

