% function [L,U,P]=PALU(A) for (solving Gaussian Elimination with Partial Pivoting) 
function [L,U,P]=PALU(A) 
[m n]=size(A); 
if (m~=n) 
    error('matrix A must be square'); 
end 
P=eye(n); Q=1:n-1; 
% Forward Elimination with Partial Pivoting 
for i=1:n-1 
    t=abs(A(i,i)); 
    for k=i+1:n 
        if (abs(A(k,i))>t) 
            t=abs(A(k,i)); kmax=k; 
        end
    end
    Q(i)=kmax; 
    tv=A(i,i:n); 
    A(i,i:n)=A(kmax,i:n);
    A(kmax,i:n)=tv; 
    rowvec=P(i,:); P(i,:)=P(kmax,:); P(kmax,:)=rowvec; % compute P 
    for k=i+1:n 
        r=A(k,i)/A(i,i); 
        A(k,i+1:n)=A(k,i+1:n)-r*A(i,i+1:n); 
        A(k,i)=r; 
    end
end 
% Switch Q(j+1) with L(j) in PA=LU 
for i=2:n-1 
    k=Q(i); 
    if (k~=i) 
        rv=A(i,1:i-1); 
        A(i,1:i-1)=A(k,1:i-1); 
        A(k,1:i-1)=rv;
    end
end
 L=eye(n); U=zeros(n,n);    
 for i=1:n 
     for j=1:n
         if (i==j) 
             U(i,j)=A(i,j); 
         elseif (i>j) 
             L(i,j)=A(i,j); 
         elseif (i<j) 
             U(i,j)=A(i,j); 
         end
     end
 end
end

