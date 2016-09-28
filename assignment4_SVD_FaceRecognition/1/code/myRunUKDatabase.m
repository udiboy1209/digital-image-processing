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
kArray = [1, 2, 3, 5, 10, 15, 20, 30, 50, 75, 100, 150, 170];
recArray = zeros(length(kArray),1);

for p = 3:34
    person = people_folders(p);
    for i = 1:6
        face = imread(sprintf('%s/%s/%d.pgm',database_dir,person.name,i));
        trainArray(:,6*(p-3)+i) = reshape(face,M*N,1);
    end 
end


for k = kArray
    count = count + 1;
    
    [eC, eV, xbar] = myMiniFaceRecTrain(k, trainArray);

    recRate = 0;

    for p = 3:34%num_people
        person = people_folders(p);
        for i = 7:10
            face = imread(sprintf('%s/%s/%d.pgm',database_dir,person.name,i));
            testVec = double(reshape(face,M*N,1))-xbar;
            index = myMiniFaceRecTest(testVec, eC, eV);
            if((p - 2) == floor((index-1)/6) + 1)
                recRate = recRate + 1;
            end 
        end    
    end
    recArray(count) = recRate; 
end;

plot(kArray, recArray);
toc;

end

