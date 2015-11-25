J=imread('primatecaged.jpg');
I=rgb2gray(J)
figure('name', 'Image with interference');
imshow(I);

ID = im2double(I);
FID = fft2(ID);
S=abs(FID).^2;
figure('name', 'Power spectrum with interference');
colormap('default');
imagesc(S.^0.1); 
FID(250:256,8:14)=0;
FID(2:8,244:250)=0;
S1=abs(FID).^2;
figure('name', 'Power spectrum without interference');
colormap('default');
imagesc(fftshift(S1.^0.1)); 
IFID=ifft2(FID);
NewImg = im2uint8(IFID);
figure('name', 'Free primate');
imshow(NewImg);
