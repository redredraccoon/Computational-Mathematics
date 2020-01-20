%
% Script file: PCA.m
% Find the first K Principal Components of data X (n rows, d columns)
% X contains n pattern vectors with d features
%
function Y=PCA(X,K)
[n,d]=size(X);
C=cov(X);
C
[U D]=eig(C);
L=diag(D);
[sorted index]=sort(L,'descend');

R(1)=sorted(1);
for i=2:d
  R(i)=R(i-1)+sorted(i);
end
S=R(d);
for i=1:d
  R(i)=R(i)/S*100;
end
format short
sorted'
R

Xproj=zeros(d,K);        % initiate a projection matrix
for j=1:K
   Xproj(:,j)=U(:,index(j));
end
Y=X*Xproj;               % first K principal components