%% MyMainScript

tic;
%% myLinearContrastStretching
img1 = load('../data/superMoonCrop.mat');
img2 = load('../data/lionCrop.mat');

moon = myLinearContrastStretching(img1.imageOrig);
lion = myLinearContrastStretching(img2.imageOrig);

%% myUnsharpMasking
sharpened_lion = myLinearContrastStretching(myUnsharpMasking(lion,1.6, 1.5));
sharpened_moon = myLinearContrastStretching(myUnsharpMasking(moon, 1.8, 1.5));

figure,imshow(lion);
figure,imshow(sharpened_lion);
figure,imshow(moon);
figure,imshow(sharpened_moon);

imwrite(sharpened_lion, '../images/sharpened_lion.png');
imwrite(sharpened_moon, '../images/sharpened_moon.png');
toc;
