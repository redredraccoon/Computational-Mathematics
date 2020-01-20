clear all;
close all;
clc;

% %�Ĥ@??�u
% mu1=[0 0 0];  %����
% S1=[0.3 0 0;0 0.35 0;0 0 0.3];  %?��t
% data1=mvnrnd(mu1,S1,100);   %?�Ͱ�������?�u
% 
% %%�ĤG??�u
% mu2=[1.25 1.25 1.25];
% S2=[0.3 0 0;0 0.35 0;0 0 0.3];
% data2=mvnrnd(mu2,S2,100);
% 
% %�ĤT???�u
% mu3=[-1.25 1.25 -1.25];
% S3=[0.3 0 0;0 0.35 0;0 0 0.3];
% data3=mvnrnd(mu3,S3,100);
% 
% %?��?�u
% plot3(data1(:,1),data1(:,2),data1(:,3),'+');
% hold on;
% plot3(data2(:,1),data2(:,2),data2(:,3),'r+');
% plot3(data3(:,1),data3(:,2),data3(:,3),'g+');
% grid on;
% 
% %�T??�u�X���@?��???��?�u?
% data=[data1;data2;data3];   %?����data�O��???��

fin=fopen('data8OX.txt','r');
d=8+1; N=45;                         % d features, N patterns
fgetl(fin); fgetl(fin); fgetl(fin);  % skip 3 header lines
A=fscanf(fin,'%f',[d N]);  A=A';     % read input data 
data=A(:,1:d-1);                        % remove the label in the last column

%k-means�E?
[u re]=KMeans(data,3);  %�̦Z?��???��?�u�A??�b�Ҧ�?�u���̦Z�A�N��N�O?�u�A�[�@?��
[m n]=size(re);

%�̦Z?�ܻE?�Z��?�u
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