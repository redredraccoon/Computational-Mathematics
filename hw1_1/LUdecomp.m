% function [L,U]=LUdecomp(A) - A=LU decomposition 
% Compute the LU decomposition of A such that (L,U) appeared in output A 
function [L,U]=LUdecomp(A) 
[m n]=size(A); 
if (m~=n)
    error('matrix A must be square');
end 
A
% Forward Elimination 
for i=1:n-1 
    for k=i+1:n 
        r=A(k,i)/A(i,i); 
        A(k,i+1:n)=A(k,i+1:n)-r*A(i,i+1:n); 
        A(k,i)=r; 
    end
end 
L=zeros(m,n); 
U=zeros(m,n); 
for i=1:m 
    for j=1:n 
        if (i>j) 
            L(i,j)=A(i,j);
        elseif (i==j) 
            L(i,j)=1; 
            U(i,j)=A(i,j); 
        elseif (i<j) 
            U(i,j)=A(i,j); 
        end
    end
end 

end

