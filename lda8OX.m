% lda8OX.m - Linear Discriminant Projection for data8OX.txt
%
fin=fopen('data8OX.txt');
nf=8;     n=45;                       % nf features, n patterns
L(1)=15;  L(2)=30;  L(3)=45;          % L(3)=n
fgetl(fin); fgetl(fin); fgetl(fin);   % skip 3 header lines
A=fscanf(fin,'%f',[1+nf n]); A=A';    % read input data 
d=8;  nk=15;  X=A(:,1:d);
%
% 6(a) - Covariance Matrix T,  [n d]=size(X);  n=45,  d=8
%
X1=X(1:L(1),:);  X2=X(1+L(1):L(2),:);  X3=X(1+L(2):L(3),:);
m1=mean(X1);    m2=mean(X2);    m3=mean(X3);
mu=mean(X);     T=cov(X);
W1=cov(X1);     W2=cov(X2);     W3=cov(X3); 
W=(nk-1)*(W1+W2+W3);
B=nk*((m1-mu)'*(m1-mu)+(m2-mu)'*(m2-mu)+(m3-mu)'*(m3-mu));
s=0.0001;
C=(inv(W+s*eye(d)))*(B+eps);
%
% 6(b) - Compute Eigenvalues of W^{-1}B
%
[U D]=eig(C);
Lambda=diag(D);
[Cat index]=sort(Lambda,'descend');
%
% 6(c) - Compute Percentage of Variance Retained
%
R(1)=Cat(1);
for i=2:d
  R(i)=R(i-1)+Cat(i);
end
S=R(d);
for i=1:d
  R(i)=R(i)/S*100;
end
format short
L',R
%
% 6(d) - LDA for 8OX data set
%
K=2;
Xproj=zeros(K,d);                     % initiate a projection matrix
for i=1:K
   Xproj(i,:)=U(:,index(i))';
end
Y=(Xproj*X')';                        % first K discriminant components
X1=Y(1:L(1),1);      Y1=Y(1:L(1),2);
X2=Y(1+L(1):L(2),1); Y2=Y(1+L(1):L(2),2);
X3=Y(1+L(2):L(3),1); Y3=Y(1+L(2):L(3),2);
plot(X1,Y1,'d',X2,Y2,'O',X3,Y3,'X','markersize',10);
legend('- 8','- O','- X')
% axis([2 24 -2 20]); grid;
% title('First Two Linear Discriminant Projection for data8OX')