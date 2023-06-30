function cn = cond_num(V)
    s = svd(V);
    cn = max(s) / min(s);
end
