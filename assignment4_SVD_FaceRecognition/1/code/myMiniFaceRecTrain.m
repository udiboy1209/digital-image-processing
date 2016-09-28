function [ eigenCoordinates , eigenVectors , meanVector  ] = myMiniFaceRecTrain( k , trainArray )
%MYMINIFACERECTRAIN Summary of this function goes here
%   Detailed explanation goes here
    [D , N] = size(trainArray);
    meanVector = (1/N)*sum(trainArray , 2); 
    
    X = bsxfun( @minus , trainArray , meanVector);
    C = X'*X;
    [ eigVect , eigenValues ] = eigs(C , k);
    eigenVectorsT = X*(eigVect);
    eigenVectorsT = normc(eigenVectorsT);
    eigenCoordinates = (eigenVectorsT(:,1:k))'*X;
    eigenVectors = eigenVectorsT(:,1:k);
    
end

