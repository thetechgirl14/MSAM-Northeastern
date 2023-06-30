function [eigvals, iterations] = jacobi_eig(A, tol)

n = size(A, 1);
Q = eye(n);
iterations = 0;

while true
   
    max_offdiag = max(abs(triu(A, 1)), [], 'all');
    if max_offdiag < tol 
        eigvals = diag(A); 
        return
    end
   
    [i, j] = find(abs(A) == max_offdiag, 1);
    
    % Compute the Jacobi matrix Qij
    Qij = eye(n);

    if A(i, j) ~= 0
        tau = (A(j, j) - A(i, i)) / (2 * A(i, j));
        t = sign(tau)/(abs(tau) - sqrt(tau^2 + 1)); 
        c = 1 / sqrt(1 + t^2);
        s = c*t;
    else
        c = 1;
        s = 0;
    end
    
    Qij(i, i) = c;
    Qij(j, j) = c;
    Qij(i, j) = s;
    Qij(j, i) = -s;

    % Update A and Q
    A = Qij' * A * Qij;
    Q = Q * Qij;
    
    iterations = iterations + 1;
end
