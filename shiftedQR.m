function Eigvalue=shiftedQR(A)
tolerance=1.0e-12;
nrun=50;
m=size(A,1);
n=m;
while n>1
    nc=0;
    while (norm(A(n,1:n-1),1)>tolerance) && (nc<nrun)
        nc=nc+1;
        sigma=A(n,n);
        [Q, R]=qr(A-sigma*eye(n));
        A=R*Q+sigma*eye(n);
         disp(A)
    end
    if (nc<nrun)
        Eigvalue(n)=A(n,n);
        n=n-1;
        A=A(1:n,1:n);        % deflation technique
    else                     % have 2x2 blocks
        a=A(n-1,n-1); b=A(n-1,n);
        c=A(n,  n-1); d=A(n,  n);
        Eigvalue(n-1)=((a+d)-sqrt((a-d)^2+4*b*c))/2;
        Eigvalue(n)=  ((a+d)+sqrt((a-d)^2+4*b*c))/2;
        n=n-2;               % deflation technique
        A=A(1:n,1:n);
    end
end
if (n>0)
    Eigvalue(1)=A(1,1);      % The last and only 1x1 block remains
end
%----------End of the shifted-QR by deflation technique--------------%