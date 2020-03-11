RGB = imread('DSCF5514.JPG');
I = rgb2gray(RGB);
K = wiener2(I,[5 5]);
figure('units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1),imshow(I);
title('Noised Image');
subplot(1,2,2),imshow(K);
title('Denoised Image');
imwrite(K, 'denoised.jpg','jpg');