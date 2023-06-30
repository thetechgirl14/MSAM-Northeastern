% Test program for the pell function

N = 100;
pell_numbers = pell(N);

% Test 1: Check if each number satisfies the recurrence relation
for i = 3:N
    if (pell_numbers(i) ~= 2 * pell_numbers(i-1) + pell_numbers(i-2))
        fprintf("Test 1 failed at index %d\n", i);
        return;
    end
end
fprintf("Test 1 passed\n");

% Test 2: Check if each number satisfies the "Binet-type" formula
tolerence = 2e23;
for i = 1:N
    binet_formula = (1+sqrt(2)).^(i-1) - (1-sqrt(2)).^(i-1);
    binet_formula = binet_formula / (2*sqrt(2));
    if (pell_numbers(i) > round(binet_formula) + tolerence)
        fprintf("Test 2 failed at index %d\n", i);
        return;
    end
end
fprintf("Test 2 passed\n");
