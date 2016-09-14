function [ output ] = myMeanShiftSegmentation(img, bandwidth)
[M, N, C] = size(img);

pixels = reshape(img, M*N, C);

bandSq = bandwidth^2;
numPx = M*N;

numLeft = numPx;
updated = pixels;
output = zeros(numPx,C);
converged = zeros(numLeft,1,'uint8');
shiftThres = bandwidth*1e-3;

while numLeft
    tic;
    for i = 1:numLeft
        px = updated(i,:);
        dist = sum((pixels - repmat(px, numPx, 1)).^2, 2);
        
        nearest = pixels(dist < bandSq,:);
        newpx = sum(nearest,1)./size(nearest,1);
        
        if sum((newpx - px).^2) < shiftThres
            % Point converged
            
            numLeft = numLeft - 1;
            output(i,:) = newpx;
            converged(i) = 1;
        else
            updated(i,:) = newpx;
        end
    end
    updated = updated(converged == 0, :);
    disp(numLeft);
    toc;
end

output = reshape(output,M,N,C);