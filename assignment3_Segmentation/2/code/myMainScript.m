%% MyMainScript

tic;
%% Your code here
baboon = rescale(imread('../data/baboonColor.png'));
[M, N, C] = size(baboon);

h = fspecial('gaussian',1);
baboon = imfilter(baboon,h);
baboonSmall = baboon(1:2:M, 1:2:N, :);
figure, imshow(baboonSmall);

out = myMeanShiftSegmentation(baboonSmall, 20.0/255);
figure, imshow(out);
toc;
