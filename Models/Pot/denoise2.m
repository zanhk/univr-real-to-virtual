net = denoisingNetwork('DnCNN');

%Load a grayscale image into the workspace, then create a noisy version of the image. Display the two images.

I = imread('noise.tif');
noisyI = imnoise(I,'gaussian',0,0.01);
imwrite(noisyI, 'noised_IMG.jpg','jpg');
figure
imshow(noisyI);



%Remove noise from the noisy image, and display the result.
%
net = denoisingNetwork('DnCNN');
denoisedI = denoiseImage(noisyI, net);
figure
imshow(denoisedI)
title('Denoised Image')
imwrite(denoisedI, 'denoised_AI.jpg','jpg');