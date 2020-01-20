A=[4.00001,1.00000,2.00000;10.00000,-0.10000,3.00000;5.00000,3.00000,1.00000];
b=[4.00001,12.80000,12.00000]';
[x,P]=GaussPP(A,b);
x
%[L,U]=LUdecomp(A);
%L
%U
[L,U,P]=PALU(A) ;   %(b) Find PA = LU, where L is unit lower?? and U is upper?? 
P