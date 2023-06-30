function pell_num = pell(N)
    pell_num = zeros(1, N);
    pell_num(1) = 0;
    pell_num(2) = 1;
    for i = 3:N
        pell_num(i) = 2 * pell_num(i-1) + pell_num(i-2);
    end
end