function test_gauss_chebyshev_quadrature()

    % True value of the integral
    true_value = pi * log(1+sqrt(2));
    
    % Testing the function for different values of N
    for N = 1:100
       
        computed_value = Gauss_Chebyshev_Quadrature(N);
        
        error = abs(computed_value - true_value);
        
        tolerance = 1e-4;
        if error > tolerance
            fprintf('Test Failed: N = %d, Error = %f, Computed Value = %f, True Value = %f\n', N, error,computed_value, true_value);
        else
            fprintf('Test Passed: N = %d, Error = %f, Computed = %f, True Value = %f\n', N, error,computed_value, true_value);
            fprintf("The minimum N required to achieve accuracy better than 1e-4 is %d\n", N);
            break
        end
    end
end
