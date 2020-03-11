A = imread('blurred.tif');
figure; imshow(A)
A = double(A);
figure; imshow(A)
H = fspecial('laplacian',0.5);
figure; imshow(H)
B = imfilter(A,H);
figure; imshow(B)
C = double(A) - double(B);
figure; imshow(uint8(C))