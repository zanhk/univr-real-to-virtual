clear all
close all
clc
f=imread('blurred.tif');
f=double(f);
figure,imshow(f,[])
 
M=size(f,1); N=size(f,2); % nr of rows/columns of image f
C=3; D=3; % nr of rows/columns of kernel h
P=M+C-1; Q=N+D-1; % nr of rows/columns after padding
fp=zeros(P,Q); % zero padding: start with zeroes
fp(1:M,1:N)=f; % insert f into image fp
hp=zeros(P,Q); % Construct filter matrix hp, same size as fp.
hp(1,1)=-4; hp(2,1)=1; hp(1,2)=1; % Center is at (1,1)
hp(P,1)=1; hp(1,Q)=1; % Indices modulo P or Q
 
Fp=fft2(double(fp), P, Q); % FFT of image fp
Hp=fft2(double(hp), P, Q); % FFT of kernel hp
H = fftshift(Hp);%swaps the left and right halves of Hp
F1 = abs(H); % Get the magnitude
F1 = log(F1+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
F1 = mat2gray(F1,[0 1]);%converts the matrix F1 to the intensity image F1
figure,imshow(F1);
 
Gp=Fp .* Hp; % Product of FFTs
gp=ifft2(Gp); % Inverse FFT
gp=real(gp); % Take real part
g=gp(1:M, 1:N);
figure,imshow(g,[])
 
gnorm = g;
gshar = double(f) - gnorm;
figure,imshow(uint8(gshar))