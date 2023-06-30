function Ccorr = analyzer_corrected(Craw, Vmeas)
    % This is the base fcn for HW9 problem 3.  The
    % problem involves correcting the non-linear response
    % of a gas analyzer.
  
    % Compute the concentration error using linear interpolation
    Cact = [0, 0.1, 0.2, 0.5, 1.0, 2.0, 5.0, 10.0, 20.0 , 25];
    %Vact = [0.1, 0.101501, 0.103024, 0.107725, 0.116000, 0.134200, 0.202000, 0.359000, 0.838000, 1.160000];
    %Cact = linspace(0,25,30);

    % Compute the concentration error di at each Vmeas
    dact = zeros(size(Vmeas));
    for i = 1:length(Cact)
        dact(i) = Cact(i) - Craw(i);  
    end
    di = linterp1(Cact, dact, Craw);
    
    % Correct the raw instrument response by subtracting the error from the inferred concentration
    Ccorr = Craw + di;

    figure;
    plot(Cact, Craw, 'r-', Cact, Ccorr, 'b-');
    xlabel('Actual Concentration (ppm)');
    ylabel('Concentration (ppm)');
    legend('Raw Conc', 'Corrected Conc', 'Location', 'northwest');
    title ("Corrected vs Actual Gas Concentration")

    figure,
    plot(Cact, di,'r');
    ylabel("Error");
    xlabel("Actual Concentration");
    title("Error vs Actual conc.")
    
end
