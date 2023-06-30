%reading in sound file and getting sampling frequency
file = 'C:\Users\abhil\OneDrive\Desktop\git clone\MSAM-Northeastern\MATH7203\Homework\2\1_twinkle\twinkle.wav';

[y,Fs] = audioread(file);
%tune = audioplayer(y, Fs);
%play(tune)

plot_spectrogram(file);

function spectrogram = plot_spectrogram(audiofile)
    [audio, fs] = audioread(audiofile);
    
    % Defining window size and overlap
    window_size = 1600;
    overlap = window_size/2;

    % Computing spectrogram
    spectrogram = zeros(window_size, ceil((length(audio)-overlap)/(window_size-overlap)));
    key_list =[" "];
    for i=1:size(spectrogram, 2)
        start_sample = (i-1)*(window_size-overlap)+1;
        end_sample = start_sample+window_size-1;
        window = hamming(window_size).*audio(start_sample:end_sample);
        fft_window = fftshift(fft(window, window_size));
        spectrogram(:,i) = abs(fft_window);
        key_list(i) = key_check(window, fs);
    end
    
    %disp(key_list);
    % Plotting spectrogram
    figure;
    freqpoints=linspace(-fs/2,fs/2,window_size);
    smplpoints=linspace(1,ceil((length(audio)-overlap)/(window_size-overlap)),ceil((length(audio)-overlap)/(window_size-overlap)));
    imagesc(smplpoints,freqpoints,spectrogram);
    colormap("parula");
    colorbar;
    axis([0 length(audio)/window_size -fs/8 fs/8]);
end

function key = key_check(aud, Fs)

    fft_audio = fft(aud);

    [~, max_index] = max(abs(fft_audio));
    frequency = Fs * max_index / length(aud);

    freqs = [261.6 277.2 293.7 311.1 329.6 349.2 370.0 392.0 415.3 440.0 466.2 493.9];
    w = 0;
    tol = 15;
    for p = 1:12
        if (frequency >= freqs(p) - tol) && (frequency <= freqs(p) + tol)
            w = p;
        end
    end
    key = "";
    
    if (w == 1)
        key = "C";
    elseif (w == 2)
        key = "C_Sharp";
    elseif (w == 3)
        key = "D";
    elseif (w == 4)
        key = "D_Sharp";
    elseif (w == 5)
        key = "E";
    elseif (w == 6)
        key = "F";
    elseif (w == 7)
        key = "F_Sharp";
    elseif (w == 8)
        key = "G";
    elseif (w == 9)
        key = "G_Sharp";
    elseif (w == 10)
        key = "A";
    elseif (w == 11)
        key = "A_Sharp";
    elseif (w == 12)
        key = "B";
    end
    
end

