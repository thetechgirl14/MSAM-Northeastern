function heun_test()

    close all
    
    % Define the derivative function
    alpha = -0.1;
    y0 = 1;
    t0 = 0;
    f = @(t, y) alpha*y;

    tf = 100;
    
    % Define the analytical solution
    y_exact = @(t) exp(alpha*t);
    
    % Define the step sizes
    h_vals = [0.003, 0.01, 0.03, 0.1, 0.3, 1];
    
    % Compute the RMS error for each step size
    error_vals = zeros(length(h_vals), 1);
    for i=1:length(h_vals)
        h = h_vals(i);
        N = floor((tf - t0)/h);
        [t, y] = heun(f, y0, h, N);
        y_exact_vals = y_exact(t);
        error_vals(i) = sqrt(dot((y - y_exact_vals),(y - y_exact_vals))/N);
    end

    % Plot the numerical and analytical solutions
    figure,
    plot(t, y, 'o')
    hold on
    t_exact = linspace(t0, tf, 100);
    y_exact_vals = y_exact(t_exact);
    plot(t_exact, y_exact_vals, '-')
    xlabel('t')
    ylabel('y')
    legend('Heun method', 'Analytical solution')
    title("Computed solution y vs. time")
    
    % Plot the RMS error vs. step size
    figure,
    loglog(h_vals, error_vals, 'o')
    xlabel('Step size h')
    ylabel('RMS error')
    title('RMS err vs. step size h')

end