function [ histeq ] = myHE( image )

[M, N, C] = size(image);

if(C == 1)
    [counts, ~] = imhist(image);
    T = getTfromHist(counts);

    histeq = T(image+1);
else
    histeq = zeros(M, N, C);
    for C = 1:3
        [counts, ~] = imhist(image(:,:,C));
        T = cumsum(counts);
        T = (T/(T(end)))*255;

        histeq(:,:,C) = uint8(T(image(:,:,C)+1));  
    end
    histeq = uint8(histeq);
end

