% 
% Matlab - Generating p.d.f. and plot for various distributions
close all
% 1. binopdf(X,n,p), 2. nbinpdf(X,r,p), 3. geopdf(X,p),    4.poisspdf(X,r)
% 5. chi2pdf(X,r),   6. gampdf(X,a,r),  7. normpdf(X,u,s), 8.exppdf(X,t)
% 9. unifpdf(X,a,b)
%
subplot(2,2,1)
X1=1:10;  Y1=binopdf(X1,10,0.8);
X2=1:10;  Y2=nbinpdf(X2,1,0.8);
X3=1:10;  Y3=geopdf(X2,0.5);
X4=1:10;  Y4=poisspdf(X4,4);
Y=[Y1; Y2; Y3; Y4];
bar(Y)
legend('Binomial','Negative Binomial','Geometric','Poisson')
title('Binomial, Negative Binomial, Geometric, Poisson Distributions')
%
% 9. Uniform Distribution
% X1=0:0.01:1;  Y1=unifpdf(X1,0,1);  plot(X1,Y1,'r-'); 
% title('Uniform Distribution U(0,1)')
%
% 5. Chi-Square Distributions
%
subplot(2,2,2)
X5=0.1:0.1:12;
Y5a=chi2pdf(X5,2); Y5b=chi2pdf(X5,4); Y5c=chi2pdf(X5,7); Y5d=chi2pdf(X5,8);
plot(X5,Y5a,'r-',X5,Y5b,'g-',X5,Y5c,'b-',X5,Y5d,'m-'); %axis([0,12, 0,0.3])
legend('\chi^2(2)','\chi^2(4)','\chi^2(7)','\chi^2(8)')
title('\chi^2(r), r=2,4,7,8')
%
% 6. Gamma Distribution
%
subplot(2,2,3)
X6=0.1:0.1:12; t1=2; t2=3; t3=4;
Y6a=gampdf(X6,2,t1); Y6b=gampdf(X6,3,t2); Y6c=gampdf(X6,4,t3);
plot(X6,Y6a,'r-',X6,Y6b,'g-',X6,Y6c,'b-'); %axis([0,12, 0,0.3])
legend('\Gamma(2,4)','\Gamma(3,4)','\Gamma(\alpha, \lambda)')
title('\Gamma(\alpha, \lambda), \lambda=4')
%
% 7. Normal Distribution
%
subplot(2,2,4)
X7=-6:0.2:6;   u=0;  s1=1;  s2=1.6;  s3=2;  s4=3;
Y7a=normpdf(X7,u,s1); Y7b=normpdf(X7,u,s2); Y7c=normpdf(X7,u,s3);
Y7d=normpdf(X7,u,s4);
plot(X7,Y7a,'r-',X7,Y7b,'g-',X7,Y7c,'b-',X7,Y7d,'m-');axis([-6,6, 0,0.42])
legend('N(0,1)','N(0,2.56)','N(0,4)','N(0,9)')
title('Normal Distribution:  N(u,s^2)')
