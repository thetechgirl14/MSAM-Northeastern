function filter_sines()
  % This fcn creates two sine waves of different frequencies.
  % It then FFTs the time-domain signal and zeros out
  % the high frequency stuff (low-pass filter), then
  % does ifft.

  close all
    
  M = 301;         % Number of sample points
  Tmax = 1;        % max time
  dt = Tmax/(M-1); % sample freq   
  fs = 1/dt;       % Sample freq
  t = linspace(0, (M-1)*dt, M);   % Vector of timestamps
  
  % Create sine waves freqs w1, w2
  w1 = 3;      % 3 Hz signal
  w2 = 21;
  x = sin(2*pi*w1*t) + sin(2*pi*w2*t);             % Vector signal samples
  figure(1)
  plot(t, x)
  hold on
  plot(t, x, 'ro')
  title('Two sine waves')
  
  % Set filter bandwidth B
  B = 10;
  
  % Now do FFT of input signal
  Xf = fft(x); % Fast Fourier Transform
  w = linspace(0, (M-1)*(fs/M), M);   % Vector of frequency axis samples
  
  % Shift over negative freqs on frequency axis in prep for fftshift
  w1 = w;
  w1(w >= fs/2) = w(w >= fs/2) - fs;
  ws = fftshift(w1);
  Xfs = fftshift(Xf);
  figure(2)
  plot(ws, abs(Xfs))
  hold on
  plot(ws, abs(Xfs), 'ro')  
  title('FFT of input signal x')

  % Now zero out all frequency components above filter BW.
  idx = find(abs(ws) > B);
  filt = ones(size(ws));
  filt(idx) = 0;
  Xfs = Xfs.*filt;  % Zero out frequency components in stop band.
  max_xfs = max(abs(Xfs));
  figure(3)
  plot(ws, abs(Xfs)/max_xfs)
  hold on
  plot(ws, abs(Xfs)/max_xfs, 'ro')  
  plot(ws, filt, 'k')    
  title('Normalized FFT of filtered signal x')
  
  % Now ifft signal back to time doman
  Xf = ifftshift(Xfs);
  xnew = ifft(Xf);
  figure(4)
  plot(t, real(xnew))
  hold on
  plot(t, real(xnew), 'ro')  
  title('iFFT of filtered signal (in time domain again)')  

end
