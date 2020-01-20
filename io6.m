%
% 2016-5-03;   2008-1-2301
% Script file: h0.m modified from io6.m (check fread for raw image format)
% 1. pgm   2. bmp   3.  tif   4.  raw   5.  tif   6.  jpg
%----------------------------------------------------------------------
% 1. PGM
m=112;  n=92;
X=imread('1.pgm'); Z=round(double(X)); A=reshape(Z,m,n);
subplot(2,3,1)
imshow(Z/255.0)
title('112 \times 92 PGM')
% 2. BMP
m=128; n=128;
X=imread('891539.bmp');  % Z=round(double(X));  A=reshape(Z,m,n);
subplot(2,3,2)
imshow(X)
title('128 \times 128 BMP')
% 3. Raw
m=300; n=300;
subplot(2,3,3)
fin=fopen('fR01.raw','r');
X=fread(fin,m*n,'uint8=>uint8'); fclose(fin);
Y=reshape(X,m,n); Z=Y';
imshow(Z)
title('300 \times 300 Raw')
% X=fscanf(fin,'%c',[m n]); Y=X';
% Z=double(Y);
% imshow(Z/255.0)
%
% 4. Tiff
m=512; n=512;
X=imread('lenna.tif');  
subplot(2,3,4)
imshow(X)
title('512 \times 512 Gray Tiff')
% 5. JPEG
m=512; n=512;
X=imread('koala512.jpg'); 
subplot(2,3,5)
imshow(X)
title('512 \times Color JPEG')
% 6. Tiff
m=450; n=150;
X=imread('array.tif','TIFF');  % Z=round(double(X)); A=reshape(Z,m,n);
subplot(2,3,6)
imshow(X)
title('450 \times 150 Color Tiff')