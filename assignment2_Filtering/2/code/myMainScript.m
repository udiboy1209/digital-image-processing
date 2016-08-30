%% MyMainScript

tic;
%% myBilateralFiltering
barbara = load('../data/barbara.mat');

[X Y] = size(barbara.imageOrig);
m = min(min(barbara.imageOrig));
M = max(max(barbara.imageOrig));

corrupted = barbara.imageOrig + (M-m) * 0.05 * randn(size(barbara.imageOrig));
barbara = barbara.imageOrig/(M-m);

figure,imshow(barbara);

m = min(min(corrupted));
M = max(max(corrupted));
corrupted = corrupted/(M-m);

out = myBilateralFiltering(corrupted, 0.693, 0.5344);

out1 = myBilateralFiltering(corrupted, 0.693*0.9, 0.5344);
out2 = myBilateralFiltering(corrupted, 0.693*1.1, 0.5344);
out3 = myBilateralFiltering(corrupted, 0.693, 0.5344*0.9);
out4 = myBilateralFiltering(corrupted, 0.693, 0.5344*1.1);

rmsd = sqrt(sum(sum((out-barbara).^2))/(X*Y));

rmsd1 = sqrt(sum(sum((out1-barbara).^2))/(X*Y));
rmsd2 = sqrt(sum(sum((out2-barbara).^2))/(X*Y));
rmsd3 = sqrt(sum(sum((out3-barbara).^2))/(X*Y));
rmsd4 = sqrt(sum(sum((out4-barbara).^2))/(X*Y));

imwrite(out, '../images/output.png');

figure,imshow(corrupted);
figure,imshow(out);


toc;
