function [t, y] = heun(f, y0, h, N)
    % Implements Heun's method for solving an ODE
    
    % Allocate memory for solution vectors
    t = zeros(N, 1);
    y = zeros(N, length(y0));
    y(1,:) = y0;
    
    % Time loop
    for i=1:N-1
        t(i+1) = t(i) + h;
        y_temp = y(i,:) + h*f(t(i), y(i,:));
        y(i+1,:) = y(i,:) + h/2*(f(t(i), y(i,:)) + f(t(i+1), y_temp));
    end
end

