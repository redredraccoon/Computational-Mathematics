clear
clc

fin=fopen('data30x4.txt','r');
d=4+1; N=30;                         % d features, N patterns
fgetl(fin); fgetl(fin); fgetl(fin);  % skip 3 header lines
A=fscanf(fin,'%f',[d N]);  A=A';     % read input data 
X=A(:,1:d-1);                        % remove the label in the last column

stream = RandStream('mlfg6331_64');  % Random number stream
options = statset('UseParallel',1,'UseSubstreams',1,...
    'Streams',stream);

[idx,C,sumd,D] = kmeans(X,2,'Options',options,'MaxIter',30,...
    'Display','final','Replicates',100);

figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)

plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off
% histogram(idx);
% hold on
% histogram(A(:,d));
% xticks([1 2]);
% xlabel('Clusters');
% ylabel('Number of data points');
% title('Histogram of the cluster points');

% [idx,C] = kmeans(X,3);
% figure
% plot(1:45,A(:,d),'-b*',1:45,idx,'-r*')