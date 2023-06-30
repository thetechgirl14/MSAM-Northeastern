% Test program for the tanh_continued_fraction function
tolerance = 1e-6;

for i = -1.9:0.1:1.9
    x = i*pi/2;
    y = tanh_continued_fraction(x);
    actual = tanh(x);
    error = abs(y - actual);
    if (error > tolerance)
        fprintf("Test failed at x = %f\n", x);
        fprintf("Computed value: %f\n", y);
        fprintf("Actual value: %f\n", actual);
        fprintf("Error: %f\n", error);
    end
end
fprintf("All tests passed\n");
