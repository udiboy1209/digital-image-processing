function [ ] = myRunYaleDatabase( )

%% Your code here
database_dir = uigetdir();

tic;
people_folders = dir(database_dir);
%num_people = size(people_folders);

M = 192;
N = 168;
trainArray = zeros(M*N,38*60);

kArray = [2, 10, 20, 50, 75, 100, 125, 150, 175];

for p = 3:40%num_people
    imageDir = strcat(database_dir,'/',people_folders(p).name);
    imgFolder = dir(imageDir);
    %disp(imageDir);

    for i = 3:62
        face = imread(sprintf('%s/%s/%s',database_dir,people_folders(p).name,imgFolder(i).name));
        trainArray(:,60*(p-3)+(i-2)) = reshape(face,M*N,1);
    end 
end

figure;
face = rescale(reshape(trainArray(:,60*7+37), M, N));
subplot(2,5,1), imshow(face);
for i = 1:9
    k = kArray(i);
    [eC, eV, xbar] = myMiniFaceRecTrain(k, trainArray);
    
    % Reconstruct
    reconstructed = eV*eC(:,60*7+33);
    subplot(2,5,i+1), imshow(rescale(reshape(reconstructed, M, N)));
end

figure;
[eC, eV, xbar] = myMiniFaceRecTrain(25, trainArray);
for i = 1:25
    eigenFace = rescale(reshape(eV(:,i),M,N));
    subplot(5,5,i), imshow(eigenFace);
end

toc;

end