function [t, y] = explicit_midpoint(alpha, tspan, y0, h)
    % Solve f = alpha * y using the explicit midpoint method
   
    f = @(t, y) alpha*y;

    % Set up the time steps
    n = (tspan(2)-tspan(1))/h;
    t = linspace(tspan(1), tspan(2), n);

    % Initialize the solution vector
    y = zeros(1, n);
    y(1) = y0;

    % Implement the explicit midpoint method
    for i = 1:n-1
        k1 = h * f(t(i),y(i));
        k2 = h * f(t(i) + h/2,y(i) + k1/2);
        y(i+1) = y(i) + k2;
    end

end
