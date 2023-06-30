function clarinet_reed
    
    close all
    
    global m;
    global k;
    global a;
    global b;
    global h;
    
    m = 1;
    k = 2;
    a = 2;
    b = 0.5;

    % create vector y
    y0 = [0 0.001];

    % Time vector
    tspan = [0 50];
    N = 100;
    h = (tspan(2) - tspan(1)) / N;
    t = linspace(tspan(1), tspan(2), N);
    
    % Solve the system using 4th-order Runge-Kutta
    y = zeros(N, 2);
    y(1,:) = y0;
    
    for n = 1:N-1
        k1 = h * f(t(n), y(n,:));
        k2 = h * f(t(n) + h/2, y(n,:) + k1/2);
        k3 = h * f(t(n) + h/2, y(n,:) + k2/2);
        k4 = h * f(t(n) + h, y(n,:) + k3);
        y(n+1,:) = y(n,:) + (k1 + 2*k2 + 2*k3 + k4) / 6;

    end

    size(y)
    t = t';
    size(t)
    

    % Plot x vs. t
    figure;
    plot(t, y(:,1));
    xlabel('Time');
    ylabel('x');
    title('Clarinet Reed Oscillation');
    
    % Plot phase plot
    figure;
    plot(y(:,1), y(:,2));
    xlabel('x');
    ylabel('dx/dy');
    title('Clarinet Reed Phase Plot');
end


function dydt = f(t, y)

  global m;
  global k;
  global a;
  global b;
  
  dydt = [y(2); (-k*y(1) + a*y(2) - b*(y(2))^3)/m];

end
   

