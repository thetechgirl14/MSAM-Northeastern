function yi = linterp1(x, y, xi)
    % Linear interpolation
    n = length(x);
    yi = zeros(size(xi));
    for i = 1:length(xi)
        j = find(x <= xi(i), 1, 'last');
        if isempty(j)
            j = 1;
        elseif j < n
            j = j + (xi(i) > x(j));
        end
        if j == n
            yi(i) = y(n);
        else
            t = (xi(i) - x(j)) / (x(j+1) - x(j));
            yi(i) = (1-t)*y(j) + t*y(j+1);
        end
    end
end
