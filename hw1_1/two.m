clear
clc
for n=8:4:12
    n
    H=hilb(n);
    %H
    x=ones(n,1);
    %x
    for i=1:n
        for j=1:n
            b(i,1)=H(i,j)*x(j,1);
        end
    end
    %b
    ih=invhilb(n);
    for i=1:n
        for j=1:n
            ix(i,1)=ih(i,j)*b(j,1);
        end
    end
    ix
    [new_x,P]=GaussPP(H,b);
    new_x
    %
    xx=H\b;
    xx
    clear
end
