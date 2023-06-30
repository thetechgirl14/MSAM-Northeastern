img = double(imread("C:\Users\abhil\OneDrive\Desktop\git clone\MSAM-Northeastern\MATH7203\Homework\2\3_husky\HuskyBW.png"))/255;
%imshow(img);

%Computing the FFT of the image
fft_img = fft2(img);
imshow(fft_img);

%Shifting the zero frequency component to the center
fft_img = fftshift(fft_img);

%Setting the cutoff value
C = 25;

%Creating a circular mask with radius C
[x,y] = meshgrid(1:size(img,1),1:size(img,2));
mask = (x - size(img,1)/2).^2 + (y - size(img,2)/2).^2 <= C.^2;

%Applying the mask to the FFT image
fft_img(~mask) = 0;

%Unshifting the zero frequency component
fft_img = ifftshift(fft_img);

%Computing the inverse FFT
filtered_img = ifft2(fft_img);

%Plot the original image
subplot(1,2,1);
imshow(img);
title('Original Image');

%Plot the filtered image
subplot(1,2,2);
imshow(filtered_img);
title(['After low pass filter, C =', num2str(C)]);
