function transform()
  % This fcn creates a sine wave of determined freq, then
  % Fourier transforms it.  This fcn demonstrates how the
  % time and frequency axes are related.  Info about
  % the time/frequency relationship is from: 
  % http://www.mathworks.com/help/matlab/math/fast-fourier-transform-fft.html?refresh=true
    
  M = 184;     % Number of sample points
  dt = .01;    % 10mS sample period.
  fs = 1/dt;   % Sample freq
  t = linspace(0, (M-1)*dt, M);   % Vector of timestamps
  
  w0 = 3;      % 3 Hz signal
  x = sin(2*pi*w0*t);             % Vector signal samples
  figure(1)
  % plot(t, x)
  hold on
  plot(t, x, 'ro')
  
  Xf = fft(x);       % Fast Fourier Transform
  Xf = Xf/max(Xf);   % Normalize
  w = linspace(0, (M-1)*(fs/M), M);   % Vector of frequency axis samples
  
  % Plot FT on scale where left freq is 0 and right is fs.
  figure(2)
  %plot(w, abs(Xf))
  hold on
  plot(w, abs(Xf), 'ro')
  
  % Shift over negative freqs on frequency axis in prep for fftshift
  w1 = w;
  w1(w >= fs/2) = w(w >= fs/2) - fs;
  figure(3)
  % This plots frequency spectrum on axis displaying negative and positive
  % frequency components.
  % plot(fftshift(w1), fftshift(abs(Xf)))
  hold on
  plot(fftshift(w1), fftshift(abs(Xf)), 'ro')  
end
