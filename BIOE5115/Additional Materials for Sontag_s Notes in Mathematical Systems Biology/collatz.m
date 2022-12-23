function [ns, seq] = collatz(n)
% Your first number in the sequence is n
seq(1) = n;
% You position an index on the next element of the sequence
i = 2; 

% Repeat the iteration until you find a 1
while seq(i-1) ~= 1
    % Use a modulus after division to find an even/odd number
    if mod(seq(i-1), 2) == 0
        % Step taken if even
        seq(i) = seq(i-1)/2;
    else
        % Step taken if odd
        seq(i) = 3*seq(i-1) + 1;
    end
    % Increment your index
    i = i+1;
end
% Find the length of the sequence
seq'
ns = length(seq);

