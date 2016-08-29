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

patchFiltered1 = myPatchBasedFiltering(corrupted, 5, 5, 3);

figure,imshow(barbara);
figure,imshow(patchFiltered1);

rmsd = sqrt(sum(sum((patchFiltered1-barbara).^2))/(X*Y))
toc;
