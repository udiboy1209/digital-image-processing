%% MyMainScript

tic;
%% Your code here
barbara = load('../data/barbara.mat');

[X Y] = size(barbara.imageOrig);
m = min(min(barbara.imageOrig));
M = max(max(barbara.imageOrig));

corrupted = barbara.imageOrig + (M-m) * 0.05 * randn(size(barbara.imageOrig));
barbara = barbara.imageOrig/(M-m);

m = min(min(corrupted));
M = max(max(corrupted));
corrupted = corrupted/(M-m);

out = myBilateralFiltering(corrupted, 1.5, 0.6);

rmsd = sqrt(sum(sum((out-barbara).^2))/(X*Y))

figure,imshow(barbara);
figure,imshow(out);
toc;
