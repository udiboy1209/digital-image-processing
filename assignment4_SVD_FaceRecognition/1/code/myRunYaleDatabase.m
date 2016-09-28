function [ ] = myRunYaleDatabase( )

%% Your code here
database_dir = uigetdir();

tic;
people_folders = dir(database_dir);
%num_people = size(people_folders);

M = 192;
N = 168;
trainArray = zeros(M*N,38*40);

kArray = [1, 2, 3, 5, 10, 15, 20, 30, 50, 60, 65, 75, 100, 200, 300, 500, 1000];
count = 0;
recArrayFull = zeros(length(kArray),1);
recArrayReduced = zeros(length(kArray),1);

for p = 3:40%num_people
    imageDir = strcat(database_dir,'/',people_folders(p).name);
    imgFolder = dir(imageDir);
    %disp(imageDir);

    for i = 3:42
        face = imread(sprintf('%s/%s/%s',database_dir,people_folders(p).name,imgFolder(i).name));
        trainArray(:,40*(p-3)+(i-2)) = reshape(face,M*N,1);
    end 
end

for k = kArray
    count = count + 1;
    
    [eC, eV, xbar] = myMiniFaceRecTrain(k, trainArray);
    
    if k>3
        eCReduced = eC(4:k,:); % Skip first 3 values
        eVReduced = eV(:,4:k);
    end
     
    %disp(eC);
    recRateFull = 0;
    recRateReduced = 0;

    for p = 3:40%num_people
        imageDir = strcat(database_dir,'/',people_folders(p).name);
        imgFolder = dir(imageDir);
%        disp(imageDir);
        for i = 43:62
            face = imread(sprintf('%s/%s/%s',database_dir,people_folders(p).name,imgFolder(i).name));
            testVec = double(reshape(face,M*N,1))-xbar;
            indexFull = myMiniFaceRecTest(testVec, eC, eV);
            if((p - 2) == floor((indexFull-1)/40) + 1)
                recRateFull = recRateFull + 1;
            end
            
            if k>3
                indexReduced = myMiniFaceRecTest(testVec, eCReduced, eVReduced) + 3;
                if((p - 2) == floor((indexReduced-1)/40) + 1)
                    recRateReduced = recRateReduced + 1;
                end 
            end
        end    
    end

    recArrayFull(count) = recRateFull;
    recArrayReduced(count) = recRateReduced;
    
    %disp(recRateReduced);
end;

figure, plot(kArray, recArrayFull);
figure, plot(kArray, recArrayReduced);
toc;

end