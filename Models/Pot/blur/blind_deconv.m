% --------- READ IMG ------------

I = imread('cameraman.tif');
figure
imshow(I)
title('Original Image')

% Create a point spread function (PSF). A PSF describes the degree to which an optical system 
% blurs (spreads) a point of light.

PSF = fspecial('motion',13,45);
figure
imshow(PSF,[],'InitialMagnification','fit')
title('Original PSF')

% Create a simulated blur in the image, using the PSF, and display the blurred image.

Blurred = imfilter(I,PSF,'circ','conv');
figure
imshow(Blurred)
title('Blurred Image')