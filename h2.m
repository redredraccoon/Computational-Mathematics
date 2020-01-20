%
% Script File: shiftQRB.m  (h2.m)
% Solving Eigenvalues by shifted-QR factorization
%
n=4; Nrun=20;
fin=fopen('datah2C.txt');
header1=fgetl(fin);
header2=fgetl(fin);
B=fscanf(fin,'%f',[n n]);
B=B';
SaveB=B; [U D]=eig(B);
Dvalue=(diag(D))';
Eigenvalue=shiftedQR(B);
Ds=sort(Dvalue); Es=sort(Eigenvalue);
Ds, Es
[norm(Ds-Es,1), norm(Ds-Es,2), norm(Ds-Es,inf)]