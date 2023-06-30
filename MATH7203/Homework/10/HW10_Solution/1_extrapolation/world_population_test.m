function world_population_test()
    close all    
    % Define the data
    t = [1600, 1650, 1700, 1750, 1800, 1850, 1900, 1920, 1940, 1960];
    p = [500, 545, 623, 728, 906, 1171, 1608, 1834, 2295, 3003];
    
    t_new = [1980, 1990, 2000, 2010, 2020];
    p_new = [4458, 5327, 6143, 6956, 7794];

    [rms_error, rms_error_perturbed] = world_population(t,p,t_new,p_new);

    if rms_error_perturbed > rms_error
        disp("Fit is correct!")
    else
        disp("Fit is incorrect!")
    end
end