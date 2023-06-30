function transform_windowed()
  % This fcn creates a sine wave of determined freq, then
  % Fourier transforms it.  This fcn demonstrates how the
  % time and frequency axes are related.  Info about
  % the time/frequency relationship is from: 
  % http://www.mathworks.com/help/matlab/math/fast-fourier-transform-fft.html?refresh=true
  %
  % This fcn windows the time-domain signal before FFT'ing it.
    
  M = 184;     % Number of sample points
  dt = .01;    % 10mS sample period.
  fs = 1/dt;   % Sample freq
  t = linspace(0, (M-1)*dt, M);   % Vector of timestamps
  
  w0 = 3;      % 3 Hz signal
  x = sin(2*pi*w0*t);             % Vector signal samples

  % Multiply x by window fcn u
  % Use Hann window
  Tend = t(end);
  win = (1-cos(2*pi*t/Tend))/2;
  
  figure(99)
  plot(t,win)
  title('Windowing function')
  
  
  xw = win.*x;
  figure(1)
  plot(t, xw, 'r')
  title('Time-domain signal after windowing')
  
  Xf = fft(xw);     % Fast Fourier Transform
  Xf = Xf/max(Xf);  % Normalize for comparison purposes.
  w = linspace(0, (M-1)*(fs/M), M);   % Vector of frequency axis samples
  
  % Plot FT on scale where left freq is 0 and right is fs.
  figure(2)
  plot(w, abs(Xf), 'r')
  title('Frequency spectrum on FFT axis')  
  
  % Shift over negative freqs on frequency axis in prep for fftshift
  w1 = w;
  w1(w >= fs/2) = w(w >= fs/2) - fs;
  figure(3)
  % This plots frequency spectrum on axis displaying negative and positive
  % frequency components.
  plot(fftshift(w1), fftshift(abs(Xf)), 'r')
  title('Frequency spectrum on shifted FFT axis')    
  
end
