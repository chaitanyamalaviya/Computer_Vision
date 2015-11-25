I=imread('pckint.jpg');
figure('name', 'Image with interference');
imshow(I);
ID = im2double(I);
FID = fft2(ID);
S=abs(FID).^2;
figure('name', 'Power spectrum with fftshift');
imagesc(fftshift(S.^0.1)); 
colormap('default');
figure('name', 'Power spectrum without fftshift');
imagesc(S.^0.1); 
FID(239:243,7:11) = 0;
FID(15:19,247:251) = 0;
S1=abs(FID).^2;
figure('name','Power spectrum with fftshift after removing interference');
imagesc(fftshift(S1.^0.1));

IFID = ifft2(FID);
NewImg = im2uint8(IFID);
figure('name','Resulting Image after removing interference');
imshow(NewImg)

%Further Improvements by setting 10X10 neighborhood elements to 0

FID(234:248,2:16) = 0;  
FID(10:24,242:256) = 0; 
%The 10X10 neighborhood elements of the peaks are set to 0

S2=abs(FID).^2;
colormap('default');
figure('name','Power spectrum with fftshift with improvement');
imagesc(fftshift(S2.^0.1));

IFID = ifft2(FID);
NewImg2 = im2uint8(IFID);
figure('name','Improvements');
imshow(NewImg2)


