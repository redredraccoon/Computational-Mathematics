% 4. Exponential Distribution
%
subplot(2,2,1)
X=0.1:0.1:12;
Ya=exppdf(X,1); Yb=exppdf(X,2); Yc=exppdf(X,4); Yd=exppdf(X,7);
plot(X,Ya,'r-',X,Yb,'g-',X,Yc,'b-',X,Yd,'m-'); %axis([0,12, 0,0.3])
legend('Exp(1)','Exp(2)','Exp(4)','Exp(7)')
title('(4) Exponential(\theta), \theta=1,2,4,7')
%
% 5. Chi-Square Distribution
%
subplot(2,2,2)
X=0.1:0.1:12;
Y1=chi2pdf(X,1); Y2=chi2pdf(X,2); Y4=chi2pdf(X,4); Y7=chi2pdf(X,7);
plot(X,Y1,'r-',X,Y2,'g-',X,Y4,'b-',X,Y7,'m-'); %axis([0,12, 0,0.3])
legend('\chi^2(1)','\chi^2(2)','\chi^2(4)','\chi^2(7)')
title('(5) \chi^2(r), r=1,2,4,7')
%
% 6. Normal Distribution
%
subplot(2,2,3)
X7=-6:0.2:6; u=0; s1=1; s2=2; s3=2.5; s4=3;
Y7a=normpdf(X7,u,s1); Y7b=normpdf(X7,u,s2); Y7c=normpdf(X7,u,s3);
Y7d=normpdf(X7,u,s4);
plot(X7,Y7a,'r-',X7,Y7b,'g-',X7,Y7c,'b-',X7,Y7d,'m-');axis([-6,6, 0,0.42])
legend('N(0,1)','N(0,4)','N(0,6.25)','N(0,9)')
title('(6) Normal Distribution: N(u,s^2)')