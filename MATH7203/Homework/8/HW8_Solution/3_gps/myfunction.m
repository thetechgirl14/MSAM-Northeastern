function f = myfunction(theta)
    global params
    sat_pos = params.sat_pos;
    sat_t = params.sat_t;
    c = params.c;
              
    % Calculate the residuals for each satellite
    f = zeros(4,1);
    for i = 1:4
        f(i,1) = sqrt((theta(1) - sat_pos(i,1))^2 + (theta(2) - sat_pos(i,2))^2 + (theta(3) - sat_pos(i,3))^2 - c*(theta(4) - sat_t(i)));
    end
end

