function explicit_midpoint_test()
    
    close all
    
    % Test the explicit midpoint method
    tspan = [0, 5];
    y0 = 1;
    h = 0.1;    

    % Define the analytical solution
    y_exact = @(t, alpha) exp(alpha*t);

    % Define the step sizes
    alphas = [-0.3,-0.1, 0, 0.1];

    % Compute the analytical solutiona and explicit midpoint for different alpha
    for i=1:length(alphas)
        alpha = alphas(i);
        [t, y] = explicit_midpoint(alpha, tspan, y0, h);
        y_exact_vals = y_exact(t, alpha);

        plot(t, y, '-',t, y_exact_vals,'o');
        hold on
        xlabel('t');
        ylabel('y');
        title('Solution of dy/dt');
        legend('Numerical', 'Exact',Location='northwest');
    end
   
end