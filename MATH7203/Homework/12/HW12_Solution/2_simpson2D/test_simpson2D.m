function test_simpson2D()

    close all
    
    a = -1;
    b = 1;
    c = -1;
    d = 1;
    N = 101;
    x = linspace(a, b, N);
    y = linspace(c, d, N);
    [X,Y] = meshgrid(x,y);

    disp("-----Test Case 1------")
    z = (1-X.^2).*(1-Y.^2);
    I1 = simpson2D(z, x, y);
    
    % should be approximately 1.7778
    if I1 > 1.7 && I1 < 1.8
        fprintf("Test Case 1: Test Passed!\n")
    else
        fprintf("Test Case 1: Test Failed!\n")
    end

    disp("-----Test Case 2------")
    z = (1-cos(pi*X/2).^2).*(1-cos(pi*Y/2).^2);
    I2 = simpson2D(z, x, y);
    
    % should be approximately 1
    if I2 > 0.9 && I2 < 1.1
        fprintf("Test Case 2: Test Passed!\n")
    else
        fprintf("Test Case 2: Test Failed!\n")
    end

    disp("-----Integral of MATLAB Logo------")
    s = linspace(-1, 1, N);
    [x, y] = meshgrid(s, s);
    z = membrane(1, (N-1)/2);
    surf(x, y, z)
    I3 = simpson2D(z, s, s);
    % should be approximately 1.04834
    fprintf("Integral Value of MATLAB Logo is %f \n", I3)
end