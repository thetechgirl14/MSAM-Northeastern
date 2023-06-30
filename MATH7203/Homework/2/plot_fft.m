[y,sr] = audioread('C:\Users\abhil\OneDrive\Desktop\git clone\MSAM-Northeastern\MATH7203\Homework\2\1_twinkle\twinkle.wav');

fftdata = fft(y);
fftmag = abs(fftdata);

figure;
freqs = [0:(sr/2)-1];
plot(freqs, fftmag(1:sr/2));
axis([0 sr/2 0 500]);
title('frequency response for Twinkle.wav');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

%axis([0 4000 0 500]);

for i = 1:sr/2
    if freqs(i) < 250 & freqs(i) > 500
        fftmag(i) = 0;
    end
end

figure;
plot(freqs, fftmag(1:sr/2));
axis([0 sr/2 0 500]);
title('frequency response');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
