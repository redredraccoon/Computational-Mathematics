%
% colorhistogram.m 
% 2012-0523
% 2008-0426 Read a Color Image and print the (R,G,B) color histograms
% 
m=100; n=100; npixel=m*n;
I=imread('20120427-Google.jpg');  % (m * n) * 3 = (R,G,B)
I1=I;
R=I(:,:,1);  G=I(:,:,2);  B=I(:,:,3);
hR=zeros(256);  hG=zeros(256);  hB=zeros(256);
for i=1:m
    for j=1:n
        r=1+R(i,j); g=1+G(i,j); b=1+B(i,j);
        hR(r)=hR(r)+1; 
        hG(g)=hG(g)+1;
        hB(b)=hB(b)+1;
    end
end
for k=1:256
   hR(k)=100.0*(hR(k)/npixel);
   hG(k)=100.0*(hG(k)/npixel);
   hB(k)=100.0*(hB(k)/npixel);
end
subplot(2,3,1)
imshow(I1)
subplot(2,3,4)
L=0:255;
plot(L,hR,'r-',L,hG,'g-',L,hB,'b-')
title('RGB Histograms of 100 \times 100 image')
xlabel('Intensity Levels')
ylabel('Percentage %')
%
% 2nd Color Image Picture
% 
m=304; n=405; npixel=m*n;
I=imread('20120417-HudsonRiver.jpg');  % (m * n) * 3 = (R,G,B)
I2=I;
R=I(:,:,1);  G=I(:,:,2);  B=I(:,:,3);
hR=zeros(256);  hG=zeros(256);  hB=zeros(256);
for i=1:m
    for j=1:n
        r=1+R(i,j); g=1+G(i,j); b=1+B(i,j);
        hR(r)=hR(r)+1; 
        hG(g)=hG(g)+1;
        hB(b)=hB(b)+1;
    end
end
for k=1:256
   hR(k)=100.0*(hR(k)/npixel);
   hG(k)=100.0*(hG(k)/npixel);
   hB(k)=100.0*(hB(k)/npixel);
end
subplot(2,3,2)
imshow(I2)
subplot(2,3,5)
L=0:255;
plot(L,hR,'r-',L,hG,'g-',L,hB,'b-')
title('RGB Histograms of 304 \times 405 image')
xlabel('Intensity Levels')
ylabel('Percentage %')
%
% 3rd Color Image Picture
% 
m=512; n=512; npixel=m*n;
I=imread('koala512.jpg');  % (m * n) * 3 = (R,G,B)
I3=I;
R=I(:,:,1);  G=I(:,:,2);  B=I(:,:,3);
hR=zeros(256);  hG=zeros(256);  hB=zeros(256);
for i=1:m
    for j=1:n
        r=1+R(i,j); g=1+G(i,j); b=1+B(i,j);
        hR(r)=hR(r)+1; 
        hG(g)=hG(g)+1;
        hB(b)=hB(b)+1;
    end
end
for k=1:256
   hR(k)=100.0*(hR(k)/npixel);
   hG(k)=100.0*(hG(k)/npixel);
   hB(k)=100.0*(hB(k)/npixel);
end
subplot(2,3,3)
imshow(I3)
subplot(2,3,6)
L=0:255;
plot(L,hR,'r-',L,hG,'g-',L,hB,'b-')
title('RGB Histograms of 512 \times 512 image Koala')
xlabel('Intensity Levels')
ylabel('Percentage %')