function sd = slide_disp(theta1)
    % Parameters
    global params
    R1 = params.R1;
    R2 = params.R2;
    Rc = params.Rc;
    L = params.L;
    
    % Turn angle of the green circle
    theta2 = pi - (theta1*((R1/R2) - 1));
    
    x = R2*cos(theta1) + Rc*cos(theta2);
    y = R2*sin(theta1) + Rc*sin(theta2);
    phi = asin(y/L);
    
    % Slide displacement
    sd = x + L*cos(phi);
    
end
