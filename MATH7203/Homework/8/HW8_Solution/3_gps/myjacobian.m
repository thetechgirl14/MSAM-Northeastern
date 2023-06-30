function J = myjacobian(theta)  
    global params
    sat_pos = params.sat_pos;
    sat_t = params.sat_t;
    c = params.c;

    % Calculate the Jacobian matrix for each satellite
    J = zeros(4,4);
    for i = 1:4
        % Calculate the partial derivatives for each component of the output vector
        df_dx = (theta(1) - sat_pos(i,1)) / sqrt((theta(1) - sat_pos(i,1))^2 + (theta(2) - sat_pos(i,2))^2 + (theta(3) - sat_pos(i,3))^2 - c*(theta(4) - sat_t(i)));
        df_dy = (theta(2) - sat_pos(i,2)) / sqrt((theta(1) - sat_pos(i,1))^2 + (theta(2) - sat_pos(i,2))^2 + (theta(3) - sat_pos(i,3))^2 - c*(theta(4) - sat_t(i)));
        df_dz = (theta(3) - sat_pos(i,3)) / sqrt((theta(1) - sat_pos(i,1))^2 + (theta(2) - sat_pos(i,2))^2 + (theta(3) - sat_pos(i,3))^2 - c*(theta(4) - sat_t(i)));
        df_dt = -c / sqrt((theta(1) - sat_pos(i,1))^2 + (theta(2) - sat_pos(i,2))^2 + (theta(3) - sat_pos(i,3))^2 - c*(theta(4) - sat_t(i)));
        J(i,:) = [df_dx df_dy df_dz df_dt];
    end
end
