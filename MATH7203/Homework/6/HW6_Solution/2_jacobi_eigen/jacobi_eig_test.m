function jacobi_eig_test()
    n = 5; 
    A = randn(n);
    A = A + A'; 
   
    
    tol = 1e-6; 
    
    [eigvals_jacobi, iterations] = jacobi_eig(A, tol);
    
    [eigvals_matlab] = eig(A);
    
    eigvals_jacobi = sort(eigvals_jacobi); 
    eigvals_matlab = sort(eigvals_matlab); 
    
    disp("Eigenvalues (Jacobi method):");
    disp(eigvals_jacobi);
    
    disp("Eigenvalues (MATLAB eig function):");
    disp(eigvals_matlab);
    
    disp("Number of iterations required:");
    disp(iterations);
    
    if (eigvals_jacobi - eigvals_matlab < tol)
        fprintf("Test Passed! \n");
    else
        fprintf("Test Failed! \n");
    end
end

