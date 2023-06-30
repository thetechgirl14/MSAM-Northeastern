function test_savitzky_golay_filter()
  
  % close all
  
  % Now read in the measured spectrum of unknown concentrations.
  unk_filename = 'unknown_mixture_spectrum.csv';
  M = csvread(unk_filename);
  v = M(:, 1);  % Wavelength axis
  S = M(:, 2);  % Spectral amplitude
  
  % Plot signal
  figure(1)
  hold on
  plot(v, S, 'b.')
  title('Noisy spectrum')
  xlabel('Wavenumber')
  ylabel('Amplitude')

  fprintf('Hit any key to continue...\n')
  pause
  
  % Now filter the spectrum & plot the filtered result
  Npts = 9;    % Number of pts to average over -- must be odd.
  Norder = 4;   % Filter order (usually quadratic or quartic)
  [vf, Sf] = savitzky_golay_filter(v, S, Npts, Norder);
  plot(vf, Sf, 'r')
  legend('Orig spectrum', 'SG filtered spectrum')
  
%  % Check Matlab's implementation
%  Sm = sgolayfilt(S, Norder, Npts);
%  figure(2)
%  hold on
%  plot(v, S, 'b')  
%  plot(v, Sm, 'r')
%  legend('Orig spectrum', 'SG filtered spectrum')
%  title('Matlabs Savitzky-Golay filter')
  
end
