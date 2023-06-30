function test_calculate_surface_area()

    close all

    % Test case 1: a unit cube
    disp("-----------Test Case 1: Unit Cube--------------")
    expected_area = 6;
    actual_area = calculate_surface_area("cube.stl");
    
    if abs(actual_area - expected_area) > 1e-6
        fprintf("Test case 1 failed. Expected area: %f, actual area: %f\n",expected_area, actual_area);
    else
        fprintf("Test case 1 passed. Expected area: %f, actual area: %f\n",expected_area, actual_area);
    end

    % Test case 2: a unit sphere
    disp("-----------Test Case 2: Unit Sphere-------------")
    expected_area = 4*pi;
    actual_area = calculate_surface_area("sphere.stl");
   
    if abs(actual_area - expected_area) > 0.01*expected_area
        fprintf("Test case 2 failed. Expected area: %f, actual area: %f\n",expected_area, actual_area);
    else
        fprintf("Test case 2 passed. Expected area: %f, actual area: %f\n",expected_area, actual_area);
    end

    % Test case 3: the Stanford bunny
    disp("-----------Test Case 3: Stanford bunny-------------")
    actual_area = calculate_surface_area("bunny.stl");
    fprintf("The surface area of the bunny is %f.\n", actual_area);

end
