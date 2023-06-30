function clarinet_reed_oscillation()

    close all

    global m;
    global k;
    global a;
    global b;
    global h;
  
    % Parameters
    m = 1;
    k = 2;
    a = 2;
    b = 0.5;
    
    % Initial conditions
    y0 = [0 0.001];
    
    % Time vector
    tspan = [0 30];
    N = 1000;
    h = (tspan(2) - tspan(1)) / N;
    t = linspace(tspan(1), tspan(2), N);
    
    % Solve the system using 4th-order Runge-Kutta
    y = RK4(y0, N);

    % Plot phase plot
    figure;
    plot(y(1,:), y(2,:));
    xlabel('x');
    ylabel('dx/dt');
    title('Phase Plot');

    % Plot x vs. t
    figure;
    plot(t, y(1,:));
    xlabel('Time');
    ylabel('x');
    title('Reed Position vs Time');


    % Verify the solution is within the tolerance
    for n = 1:N
        residual = abs(-k*y(n) + a*y(n+1) - b*(y(n+1)-y(n))^3 - m*(y(n+2)-2*y(n+1)+y(n))/(h*h));
    end

    % Tolerance is multiple of step size h
    lowtol = h^2;
    upptol = 2/h^2;

    if residual > lowtol && residual < upptol
        disp("Test Passed!!")
    else
        disp("Test Failed!!") 
    end

end