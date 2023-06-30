function life_exp = life_expectancy(year)

    years = [1980, 1985, 1990, 1995, 2000, 2005, 2010];
    life_expectancy = [73.7, 74.7, 75.4, 75.8, 77.0, 77.8, 78.7];
    
    % Pad the data with another set of values to avoid errors
    years = [years, 2020];
    life_expectancy = [life_expectancy, 76.1];
    
    % Define a function that performs linear interpolation
    interp_fun = @(x) linterp(years, life_expectancy, x);
    
    % Test the interpolation function
    life_exp = interp_fun(year); % expected output: 76.15

end
