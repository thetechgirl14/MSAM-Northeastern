function jacobi_rotation_test()
    n = 5;
    
    A = rand(n);
    A = A + A'; 
    
    i = 2;
    j = 4;
    
    Qij = jacobi_rotation(A, i, j);
    
    A_new = Qij' * A * Qij;
    
    tol = 1e-6; 
    if abs(A_new(i, j)) < tol && abs(A_new(j, i)) < tol
        disp('Off-diagonal elements successfully zeroed out!');
    else
        disp('Error: off-diagonal elements not zeroed out.');
    end
end
