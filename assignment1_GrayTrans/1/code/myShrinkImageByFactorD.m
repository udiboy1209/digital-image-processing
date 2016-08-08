function undersampled = myShrinkImageByFactorD(d, image)

[M, N, C] = size(image);
undersampled = image(1:d:M,1:d:N,:);

end