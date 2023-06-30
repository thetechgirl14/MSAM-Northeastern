function chemometrics_test()

    close all

    ref_data = readtable('ref_spectra.csv');
    Unknown_data = readtable('unknown_mixture_spectrum.csv');

    S = Unknown_data{:,2};
    R_meth = ref_data{:,2};
    R_eth = ref_data{:,3};
    R_pro = ref_data{:,4};
    wavelength = Unknown_data{:,1};
    
    [c_meth, c_eth, c_pro] = chemometrics_unknown_spectrum(S, R_meth, R_eth, R_pro, wavelength);
    
    fprintf("Concentration of Methane is %f \n",c_meth)
    fprintf("Concentration of Ethane is %f \n",c_eth)
    fprintf("Concentration of Profane is %f \n",c_pro)

end