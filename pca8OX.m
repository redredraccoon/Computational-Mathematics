%
% Script file: pca8OX.m
% Principal Component Projection for data8OX.txt
%
fin=fopen('data8OX.txt','r');
d=8+1; N=45;                         % d features, N patterns
fgetl(fin); fgetl(fin); fgetl(fin);  % skip 3 header lines
A=fscanf(fin,'%f',[d N]);  A=A';     % read input data 
X=A(:,1:d-1);                        % remove the label in the last column
k=2;  Y=PCA(X,k);                   % better Matlab code
X1=Y(1:15,1); Y1=Y(1:15,2); 
X2=Y(16:30,1); Y2=Y(16:30,2);
X3=Y(31:45,1); Y3=Y(31:45,2);
plot(X1,Y1,'d',X2,Y2,'O',X3,Y3,'X', 'markersize',12);  
axis([4 24 -2 18]);
legend('8','O','X')
title('First Two Principal Component Projection for 8OX Data')