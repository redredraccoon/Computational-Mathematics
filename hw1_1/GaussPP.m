function [x,P]=GaussPP(A,b) 
[m n]=size(A); 
if (m~=n) 
    error('matrix A must be square'); 
end 
P=1:n; 
Aug=[A, b]; % the augmented matrix 
% Forward Elimination 
for i=1:n-1 
    kmax=i; 
    t=abs(Aug(i,i)); 
    for k=i+1:n 
        if (abs(Aug(k,i))>t) 
            t=abs(A(k,i)); 
            kmax=k; 
        end
    end
    if (kmax~=i) 
        tv=Aug(i,i:n+1); 
        Aug(i,i:n+1)=Aug(kmax,i:n+1); 
        Aug(kmax,i:n+1)=tv; 
        kr=P(i); 
        P(i)=P(kmax); 
        P(kmax)=kr; 
    end 
    for k=i+1:n 
        r=Aug(k,i)/Aug(i,i); 
        Aug(k,i+1:n+1)=Aug(k,i+1:n+1)-r*Aug(i,i+1:n+1); 
        Aug(k,i)=r; 
    end
end 
% Back Substitution 
x=zeros(n,1); 
x(n)=Aug(n,n+1)/Aug(n,n); 
for j=n-1:-1:1 
    x(j)=(Aug(j,n+1)-Aug(j,j+1:n)*x(j+1:n))/Aug(j,j);
end
end

