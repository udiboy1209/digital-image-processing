%% MyMainScript

tic;
%% Your code here
img1 = load('../data/superMoonCrop.mat');
img2 = load('../data/lionCrop.mat');

moon = myLinearContrastStretching(img1.imageOrig);
lion = myLinearContrastStretching(img2.imageOrig);

sharpened1 = myLinearContrastStretching(myUnsharpMasking(lion, 750, 20));
sharpened2 = myLinearContrastStretching(myUnsharpMasking(lion, 1250, 20));
sharpened3 = myLinearContrastStretching(myUnsharpMasking(lion, 1750, 20));

figure,imshow(lion);
figure,imshow(sharpened1);
figure,imshow(sharpened2);
figure,imshow(sharpened3);

toc;
