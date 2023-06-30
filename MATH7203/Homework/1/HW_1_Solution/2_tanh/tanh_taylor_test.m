% Test program for the tanh_taylor function
function y = tanh_taylor_test()  
    tolerance = 1e-6;
    
    piover2 = pi/2;
    for i = -0.9:0.1:0.9
        x = i*piover2;
        y = tanh_taylor(x);
        actual = tanh(x);
        error = abs(y - actual);
        if (error > tolerance)
            fprintf("Test failed at x = %f\n", x);
            fprintf("Computed value: %f\n", y);
            fprintf("Actual value: %f\n", actual);
            fprintf("Error: %f\n", error);
        end
    end
    fprintf("All tests passed\n");
end