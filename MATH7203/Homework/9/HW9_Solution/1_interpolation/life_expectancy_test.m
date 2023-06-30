function life_expectancy_test()

    years = [1980, 1985, 1990, 1995, 2000, 2005, 2010];
    life_expect = [73.7, 74.7, 75.4, 75.8, 77.0, 77.8, 78.7];

    years_interp = linspace(1980, 2010, 30);
    life_expectancy_interp = life_expectancy(years_interp);
    
    % Plot the estimated life expectancy
    plot(years, life_expect, 'o')
    hold on
    plot(years_interp, life_expectancy_interp, 'rx')
    xlabel('Year')
    ylabel('Life Expectancy')
    title('Estimated Life Expectancy in the USA (1980-2010)')
    legend("Recorded values", "Interpolated values", 'Location', 'northwest')
    hold off

    % life expentancy in 1997
    test_year = 1997;
    life_exp = life_expectancy(test_year);
    fprintf("Life Expectancy for the USA in %d is %f \n", test_year, life_exp)

end
