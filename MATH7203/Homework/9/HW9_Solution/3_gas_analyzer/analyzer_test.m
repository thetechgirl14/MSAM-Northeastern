function analyzer_test()

    close all

    global pmr;
    global Vz;
    global Vs;
  
    % We assume response is correct at 0 and 25ppm.
    % We assume the allowed input concentration varies 
    % from 0 -- 25ppm.
    pmr = 25;   % Primary Measurement Range
    
    % Linear response of sensor
    Vz = .1;    % zero 0ppm, sensor output = .1V
    Vs = 1.16;  % span 25ppm, sensor output =  1.16V
  
    % Create plot of Craw and Ccorr vs. Cact.
    Cact = [0, 0.1, 0.2, 0.5, 1, 2, 5, 10, 20 , 25];
    %Cact = linspace(0,25,30);
    
    Vmeas = sensor_response(Cact);
    Craw = analyzer_volt_to_raw_conc(Vmeas);
    Ccorr = analyzer_corrected(Craw, Vmeas);

    % Verify that Ccorr remains within 5% of Cact over the entire input range of the instrument.
    for i = 1:length(Cact)
        diff = abs(Ccorr(i) - Cact(i));
        if diff > 0.05*Cact(i)
            disp('Error: Ccorr is not within 5% of Cact.');
            break;
        else
            disp("Ccorr is within 5% of Cact.");
            break;
        end
    end
    
end


