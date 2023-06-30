function V = vandermonde(x)

    N = length(x);
    V = ones(N, N);
    for i = N:-1:2
        V(:, i) = x .^ (i - 1);
    end
end


%question: does the column sequence matter? If yes, how do we change that?