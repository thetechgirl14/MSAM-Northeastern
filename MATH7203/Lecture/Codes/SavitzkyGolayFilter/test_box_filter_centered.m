function test_box_filter_centered()
  
  % close all
  
  % Now read in the measured spectrum of unknown concentrations.
  unk_filename = 'unknown_mixture_spectrum.csv';
  M = csvread(unk_filename);
  v = M(:, 1);  % Wavelength axis
  S = M(:, 2);  % Spectral amplitude
  
  % Plot signal
  figure(3)
  hold on
  plot(v, S, 'b.')
  title('Noisy spectrum')
  xlabel('Wavenumber')
  ylabel('Amplitude')

  fprintf('Hit any key to continue...\n')
  pause()
  
  % Now filter the spectrum & plot the filtered result
  Npts = 9;    % Number of pts to average over -- must be odd.
  [vf, Sf] = box_filter_centered(v, S, Npts);
  plot(vf, Sf, 'r')
  legend('Original spectrum', 'After box filter')

end
