function [ output ] = myHarrisCornerDetector( img, patch, sigma, k )
%MYHARRISCORNERDETECTION Summary of this function goes here
%   Detailed explanation goes here

w = patch/2;
dx = fspecial('sobel');     % Filter for Ix
dy = dx.';                  % Filter for Iy
h = fspecial('gaussian', [2*w+1, 2*w+1], sigma);
[M, N] = size(img);

Ix = imfilter(img, dx);
Iy = imfilter(img, dy);


figure,imshow(rescale(Ix));
title('Y Derivative');
figure,imshow(rescale(Iy));
title('X Derivative');

eigenvals = zeros([M N 2]);
C = zeros([M N]);

Ix2 = imfilter(Ix.^2, h);
Iy2 = imfilter(Iy.^2, h);
Ixy = imfilter(Ix.*Iy, h);

for i = 1:M
    for j = 1:N
        A = [Ix2(i,j) Ixy(i,j); Ixy(i, j) Iy2(i, j)];
        eigenvals(i,j,:) = eig(A)';
        C(i,j) = det(A) - k*(A(1,1)+A(2,2)).^2;
    end
end

figure, imshow(rescale(eigenvals(:,:,1))),colormap(parula(200)),colorbar;
title('Eigenvalue 1');
figure, imshow(rescale(eigenvals(:,:,2))),colormap(parula(200)),colorbar;
title('Eigenvalue 2');
figure, imshow(C),colormap(parula(200)),colorbar;
title('Cornerness measure');
output = C;
end

