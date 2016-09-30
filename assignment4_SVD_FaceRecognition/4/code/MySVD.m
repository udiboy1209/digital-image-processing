A=dlmread('matA.txt');
[m,n]=size(A);
[U,SST]=eig(A*A');
[V,STS]=eig(A'*A);
U   %Left singular vector
V   %Right singular vector
S=U'*A*V;  
if(m>n)
    D=(S'*S).^0.5;
else
    D=(S*S').^0.5;
end
diag(D) % The singular values
U*S*V' % Reconstruction of A
