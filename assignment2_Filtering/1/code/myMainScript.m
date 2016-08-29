%% MyMainScript

tic;
%% Your code here
img1 = load('../data/superMoonCrop.mat');
img2 = load('../data/lionCrop.mat');

moon = myLinearContrastStretching(img1.imageOrig);
lion = myLinearContrastStretching(img2.imageOrig);

sharpened1 = myLinearContrastStretching(myUnsharpMasking(lion,1.6, 1.5));
sharpened2 = myLinearContrastStretching(myUnsharpMasking(lion, 1.75, 1.5));
sharpened3 = myLinearContrastStretching(myUnsharpMasking(lion, 1.9, 1.5));

figure,imshow(lion);
figure,imshow(sharpened1);
figure,imshow(sharpened2);
figure,imshow(sharpened3);

toc;
