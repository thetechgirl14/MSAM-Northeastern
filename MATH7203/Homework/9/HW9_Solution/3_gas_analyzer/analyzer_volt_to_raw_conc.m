function Craw = analyzer_volt_to_raw_conc(Vmeas)
  % This function takes as input a voltage.  It assumes
  % the gas concentration is a linear function of the
  % input voltage.  It returns the inferred concentration
  % given the input voltage.

  global pmr;
  global Vz;
  global Vs;
  
  dV = Vs - Vz;
  
  % Concentration to report.
  Craw = (pmr./dV).*(Vmeas-Vz);

end
