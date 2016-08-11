function [ clahe ] = myCLAHE( image, k, thresh )

[M, N, C] = size(image);

clahe = zeros(M,N,C);

for h = 1:C
    [hist_i, ~] = imhist(image(1:k,1:k,h));
    T = getTfromHistCL(hist_i,thresh);
    clahe(1:k/2,1:k/2,h) = T(image(1:k/2,1:k/2,h)+1);
    
    for i = (k/2+1):(M-k/2)
        [hist_last, ~] = imhist(image(i+k/2,1:k,h));
        [hist_first, ~] = imhist(image(i-k/2,1:k,h));
        hist_i = hist_i + hist_last - hist_first;

        T = getTfromHistCL(hist_i,thresh);
        
        if i == M-k/2
            clahe(M-k/2:M,1:k/2,h) = T(image(M-k/2:M,1:k/2,h)+1);
        else
            clahe(i,1:k/2,h) = T(image(i,1:k/2,h)+1);
        end
        
        hist_i_j = hist_i;
        for j = (k/2+1):(N-k/2)
            [hist_first, ~] = imhist(image(i-k/2:i+k/2,j-k/2,h));
            [hist_last, ~] = imhist(image(i-k/2:i+k/2,j+k/2,h));
            hist_i_j = hist_i_j - hist_first - hist_last;

            T = getTfromHistCL(hist_i_j,thresh);
            clahe(i,j,h) = T(image(i,j,h)+1);
            
            if i == k/2+1
                clahe(1:k/2,j,h) = T(image(1:k/2,j,h)+1);
            elseif i == M-k/2
                clahe(M-k/2+1:M,j,h) = T(image(M-k/2+1:M,j,h)+1);
            end
        end
        clahe(i,j:N,h) = T(image(i,j:N,h)+1);
    end
    clahe(M-k/2:M,N-k/2:N,h) = T(image(M-k/2:M,N-k/2:N,h)+1);
end
