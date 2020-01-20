clear all;
close all;
clc;

% %第一??据
% mu1=[0 0 0];  %均值
% S1=[0.3 0 0;0 0.35 0;0 0 0.3];  %?方差
% data1=mvnrnd(mu1,S1,100);   %?生高斯分布?据
% 
% %%第二??据
% mu2=[1.25 1.25 1.25];
% S2=[0.3 0 0;0 0.35 0;0 0 0.3];
% data2=mvnrnd(mu2,S2,100);
% 
% %第三???据
% mu3=[-1.25 1.25 -1.25];
% S3=[0.3 0 0;0 0.35 0;0 0 0.3];
% data3=mvnrnd(mu3,S3,100);
% 
% %?示?据
% plot3(data1(:,1),data1(:,2),data1(:,3),'+');
% hold on;
% plot3(data2(:,1),data2(:,2),data2(:,3),'r+');
% plot3(data3(:,1),data3(:,2),data3(:,3),'g+');
% grid on;
% 
% %三??据合成一?不???的?据?
% data=[data1;data2;data3];   %?里的data是不???的

fin=fopen('data8OX.txt','r');
d=8+1; N=45;                         % d features, N patterns
fgetl(fin); fgetl(fin); fgetl(fin);  % skip 3 header lines
A=fscanf(fin,'%f',[d N]);  A=A';     % read input data 
data=A(:,1:d-1);                        % remove the label in the last column

%k-means聚?
[u re]=KMeans(data,3);  %最后?生???的?据，??在所有?据的最后，意思就是?据再加一?度
[m n]=size(re);

%最后?示聚?后的?据
figure;
hold on;
for i=1:m 
    if re(i,4)==1   
         plot3(re(i,1),re(i,2),re(i,3),'ro'); 
    elseif re(i,4)==2
         plot3(re(i,1),re(i,2),re(i,3),'go'); 
    else 
         plot3(re(i,1),re(i,2),re(i,3),'bo'); 
    end
end
grid on;