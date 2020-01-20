%
% Script file: pca8OX.m
% Principal Component Projection for data8OX.txt
%
fin=fopen('dataimox.txt','r');
d=8+1; N=192;                         % d features, N patterns
fgetl(fin); fgetl(fin); fgetl(fin);  % skip 3 header lines
A=fscanf(fin,'%f',[d N]);  A=A';     % read input data 
X=A(:,1:d-1);                        % remove the label in the last column
k=2;  Y=PCA(X,k);                   % better Matlab code
X1=Y(1:48,1); Y1=Y(1:48,2); 
X2=Y(49:96,1); Y2=Y(49:96,2);
X3=Y(97:144,1); Y3=Y(97:144,2);
X4=Y(145:192,1); Y4=Y(145:192,2);
figure;
plot(X1,Y1,'d',X2,Y2,'+',X3,Y3,'O',X4,Y4,'X', 'markersize',12);  
grid;%axis([4 24 -2 18]);
legend('I','M','O','X')
title('First Two Principal Component Projection for IMOX Data')

k=3;  Y=PCA(X,k);                   % better Matlab code
X1=Y(1:48,1); Y1=Y(1:48,2); Z1=Y(1:48,3);
X2=Y(49:96,1); Y2=Y(49:96,2);Z2=Y(49:96,3);
X3=Y(97:144,1); Y3=Y(97:144,2);Z3=Y(97:144,3);
X4=Y(145:192,1); Y4=Y(145:192,2);Z4=Y(145:192,3);
figure;
plot3(X1,Y1,Z1,'d',X2,Y2,Z2,'+',X3,Y3,Z3,'O',X4,Y4,Z4,'X', 'markersize',12);  
grid;%axis([4 24 -2 18]);
legend('I','M','O','X')
title('First Three Principal Component Projection for IMOX Data')

