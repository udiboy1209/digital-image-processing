function [ min_index, dotProd ] = myMiniFaceRecTest( x_img,  eigenCoords, eigenVectors, thresh)
    x_coord = eigenVectors'*x_img;
    %[M, N] = size(eigenCoords);
    
    coordsDiff = bsxfun(@minus,eigenCoords,x_coord);
    coordsDiffSq = coordsDiff.^2;
    [mininumVal, min_index] = min((sum(coordsDiffSq)));
    
    minCoords = eigenCoords(:,min_index);
    dotProd = x_coord'*minCoords/sqrt(sum(x_coord.^2)*sum(minCoords.^2));
    
    if dotProd < thresh
        min_index = 0;
    end
end

