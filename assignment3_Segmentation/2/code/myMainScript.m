%% MyMainScript

tic;
%% Your code here
baboon = rescale(imread('../data/baboonColor.png'));
[M, N, C] = size(baboon);

h = fspecial('gaussian',1);
baboon = imfilter(baboon,h);
baboonSmall = baboon(1:2:M, 1:2:N, :);
baboonRGB = sum(baboonSmall,3)/3;

figure, imshow(baboonSmall);
figure, imshow(baboonRGB);

xyPlot = horzcat(double(repmat([1:M/2]',N/2,1))./(M/2), ...
                 double(reshape(repmat([1:N/2],M/2,1),M*N/4,1))./(N/2), ...
                 reshape(baboonRGB,M*N/4,1));
baboonSmall = reshape(baboonSmall, M*N/4,C);

intOut = myMeanShiftSegmentation(baboonSmall, 30.0/255);
intOutImg = reshape(intOut, M/2, N/2, C);

figure, show(intOutImg);

xyOut = myMeanShiftSegmentation(xyPlot, 25.5/255);
xyOutImg = reshape(xyOut(:,3),M/2,N/2);

figure, imshow(xyOutImg);
toc;