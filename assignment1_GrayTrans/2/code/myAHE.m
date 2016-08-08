function [ ahisteq ] = myAHE( image, k)

[M, N, C] = size(image);

ahisteq = zeros(M,N,C);

for h = 1:C
    [hist_i, ~] = imhist(image(1:k,1:k,h));
    T = getTfromHist(hist_i);
    ahisteq(k/2,k/2,h) = T(image(k/2,k/2,h)+1);
    
    for i = (k/2+1):(M-k/2)
        [hist_last, ~] = imhist(image(i+k/2,1:k,h));
        [hist_first, ~] = imhist(image(i-k/2,1:k,h));
        hist_i = hist_i + hist_last - hist_first;

        T = getTfromHist(hist_i);
        ahisteq(i,k/2) = T(image(i,k/2,h)+1);

        hist_i_j = hist_i;
        for j = (k/2+1):(N-k/2)
            [hist_first, ~] = imhist(image(i-k/2:i+k/2,j-k/2,h));
            [hist_last, ~] = imhist(image(i-k/2:i+k/2,j+k/2,h));
            hist_i_j = hist_i_j - hist_first - hist_last;

            T = getTfromHist(hist_i_j);
            ahisteq(i,j) = T(image(i,j)+1);
        end
    end
end