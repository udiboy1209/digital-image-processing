function [ output ] = myMeanShiftSegmentation(img, bandwidth)
[numPx, C] = size(img);

bandSq = bandwidth^2;

numLeft = numPx;
updated = img;
output = zeros(numPx,C);
converged = zeros(numLeft,1,'uint8');
shiftThres = bandwidth*1e-3;

while numLeft
    for i = 1:numPx
        if converged(i) == 0
            px = updated(i,:);
            dist = sum((img - repmat(px, numPx, 1)).^2, 2);

            nearest = img(dist < bandSq,:);
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
    end
    disp(numLeft);
end