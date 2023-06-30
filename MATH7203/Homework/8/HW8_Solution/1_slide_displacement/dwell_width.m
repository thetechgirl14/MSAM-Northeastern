function dwell_width()
    % Parameters
    global params
    params.R1 = 1;
    params.R2 = 1/2;
    params.Rc = 1/2;
    params.L = 3.5;
    
    % Use the secant method to find the angles where xi = xi_thresh

    theta_min = secant(@slide_disp, 0, pi/4, 1e-5);
    theta_max = secant(@slide_disp, pi/4, pi/2, 1e-5);
    
    % Compute the dwell width
    dwell = theta_max - theta_min;
    
    tol = 1e-6;
    % Check if the function returns zero when plugging in the root
    if (abs(slide_disp(theta_min)) < tol) && (abs(slide_disp(theta_max)) < tol)
        fprintf('Success!\n')
    else
        fprintf('Failure!\n')
    end
    
    % Display the results
    fprintf('Dwell width: %f\n', dwell);
end