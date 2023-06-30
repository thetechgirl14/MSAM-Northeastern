function [rms_error, rms_error_perturbed] = world_population(t,p,t_new,p_new)
    y = 1./p;
    
    X = [ones(length(t),1) t'];
    B = (X'*X)\X'*y';
    a = t(1);
    b = t_new(length(t_new));
    t_fit = linspace(a, b, 1000);
    y_fit = B(1) + B(2)*t_fit;
    K = 1/B(1);
    t0 = 1/B(2) + min(t);
    
    figure
    plot(t, y, 'o', t_fit, y_fit, '-')
    hold on
    xlabel('time t (Year)')
    ylabel('y = 1/Population (millions^{-1})')
    legend('Data', 'Fit')
    title(sprintf('K = %g, t0 = %g', K, t0))
    
    figure
    plot(t, p, 'o', t_fit, 1./y_fit, '-')
    hold on
    plot(t_new, p_new, 'x')
    xlabel('time t (Year)')
    ylabel('Population (millions)')
    legend('Data', 'Fit', 'New Data', Location='northwest')
    title(sprintf('K = %g, t0 = %g', K, t0))
    
    y_predicted = B(1) + B(2)*t;
    rms_error = sqrt(mean((y - y_predicted).^2));
    B_perturbed = B + 0.1*randn(size(B));
    y_perturbed = B_perturbed(1) + B_perturbed(2)*t;
    rms_error_perturbed = sqrt(mean((y - y_perturbed).^2));
end