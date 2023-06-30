function savitzkyGolay_test()
  
    close all
    % Load data from CSV file
    data = csvread('noisy_parabola.csv');

    % Extract time and position vectors
    t = data(:, 1);
    y = data(:, 2);
    
    % Compute the Savitzky-Golay filter coefficients
    window_size = 7;
    poly_order = 2;
    sg_coeffs = savitzkyGolay(poly_order, window_size);
    
    % Compute the moving second derivative using the Savitzky-Golay filter
    d2y_sg = conv(y, sg_coeffs, 'same');
   
    % Compute second derivative using finite difference formula
    dt = t(2) - t(1);
    
    n = length(y);
    for i = 2:n-1
        yd2(i) = (y(i+1) - 2*y(i) + y(i-1))/dt^2;
    end

    % Plot Savitzky-Golay filtered and finite difference second derivatives
    figure;
    plot(t, d2y_sg, 'r-');
    hold on;
    plot(t(2:end), yd2, 'b-');
    grid on;
    xlabel('Time');
    ylabel('Second Derivative');
    legend('Savitzky-Golay Filter', 'Finite Difference');

    % Analytics Second derivative of original parabola
    y_double_prime = 6;
    
    % Compare with the second derivative of the original parabola
    disp(['Analytic second derivative: ' num2str(y_double_prime)]);
    disp(['Savitzky-Golay second derivative: ' num2str(d2y_sg(10))]);
    disp(['Finite difference second derivative: ' num2str(yd2(10))]);
  
end
