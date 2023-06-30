function [c_meth, c_eth, c_pro] = chemometrics_unknown_spectrum(S, R_meth, R_eth, R_pro, wavelength)

    R = [R_meth, R_eth, R_pro];
    
    c = R\S;

    c_meth = c(1);
    c_eth = c(2);
    c_pro = c(3);
    
    
    plot(wavelength, R_meth, 'r');
    hold on;
    plot(wavelength, R_eth, 'g');
    plot(wavelength, R_pro, 'b');
    plot(wavelength, S, 'k');
    legend('Methane', 'Ethane', 'Propane', 'Unknown');
    xlabel('Wavelength');
    ylabel('Absorption');
    title('Chemometrics Linear Regression');
    hold off;

end
