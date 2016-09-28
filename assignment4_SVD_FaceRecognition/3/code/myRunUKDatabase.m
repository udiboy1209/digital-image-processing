function [ ] = myRunUKDatabase( )
%% Your code here
database_dir = uigetdir();

tic;
people_folders = dir(database_dir);
%num_people = size(people_folders);

M = 112;
N = 92;
trainArray = zeros(M*N,32*6);
count = 0;
kArray = [2, 3, 5, 10, 15, 20, 30, 50, 75, 100, 150, 170];

for p = 3:34
    person = people_folders(p);
    for i = 1:6
        face = imread(sprintf('%s/%s/%d.pgm',database_dir,person.name,i));
        trainArray(:,6*(p-3)+i) = reshape(face,M*N,1);
    end 
end

falsePositive = zeros(length(kArray), 1);
falseNegative = zeros(length(kArray), 1);

for k = kArray
    count = count + 1;
    
    [eC, eV, xbar] = myMiniFaceRecTrain(k, trainArray);

    for p = 3:34%num_people
        person = people_folders(p);
        for i = 7:10
            face = imread(sprintf('%s/%s/%d.pgm',database_dir,person.name,i));
            testVec = double(reshape(face,M*N,1))-xbar;
            [index, dotProd] = myMiniFaceRecTest(testVec, eC, eV, 0.9);
            
            if index == 0
                falseNegative(count) = falseNegative(count) + 1;
            end
        end    
    end
    
    
    for p = 35:42%num_people
        person = people_folders(p);
        for i = 7:10
            face = imread(sprintf('%s/%s/%d.pgm',database_dir,person.name,i));
            testVec = double(reshape(face,M*N,1))-xbar;
            [index, dotProd] = myMiniFaceRecTest(testVec, eC, eV, 0.9);
            
            if index > 0
                falsePositive(count) = falsePositive(count) + 1;
            end
        end    
    end 
end;

figure, plot(kArray, falsePositive);
figure, plot(kArray, falseNegative);
toc;

end

