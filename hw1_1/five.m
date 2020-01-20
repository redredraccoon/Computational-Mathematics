clear
clc
for n=3:6
v=rand(n,1);
v
u=v/norm(v,2);
u
H=eye(n)-2*u*u';
H
[norm(H'-H,1), det(H), norm(H'*H-eye(n),1)]
x=ones(n,1);
e1=zeros(n,1); e1(1,1)=1;
v=x-norm(x,2)*e1;
v
u=v/norm(v,2);
u
H=eye(n)-2*u*u';
H
y=H*x
y
end