function Qij = jacobi_rotation(A, i, j)
  
    n = size(A, 1);
    
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

end
