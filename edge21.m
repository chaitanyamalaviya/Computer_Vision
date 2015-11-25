P=imread('macritchie.jpg');
Pc=rgb2gray(P);
figure('name', 'Original Image');
imshow(Pc)

GX=[-1,-2,-1;0,0,0;1,2,1];
GY=[-1,0,1;-2,0,2;-1,0,1];
FX=conv2(Pc, GX);
figure('name', 'Horizontal Sobel Filter Output');
imshow(FX);
FY=conv2(Pc,GY);
figure('name', 'Vertical Sobel Filter Output');
imshow(FY)
F=uint8(sqrt(FX.^2+FY.^2));
figure('name', 'Combined Sobel Filter Output');
imshow(F)
Et=F>100;
figure('name', 'Threshhold=100');
imshow(Et)
Et2=F>200;
figure('name', 'Threshhold=200');
imshow(Et2)

E1 = edge(Pc,'canny',[0.04 0.1],1.0);
figure('name', 'Canny Edge Detector Output(Sigma=1.0, tl=0.04, th=0.1');
imshow(E1)

E2 = edge(Pc,'canny',[0.04 0.1],3.0);
figure('name', 'Canny Edge Detector Output(Sigma=3.0, tl=0.04, th=0.1');
imshow(E2)


E3 = edge(Pc,'canny',[0.04 0.1],5.0);
figure('name', 'Canny Edge Detector Output(Sigma=5.0, tl=0.04, th=0.1');
imshow(E3)

E4 = edge(Pc,'canny',[0.09 0.1],1.0);
figure('name', 'Canny Edge Detector Output(Sigma=1.0, tl=0.09, th=0.1');
imshow(E4)

E5 = edge(Pc,'canny',[0.02 0.1],1.0);
figure('name', 'Canny Edge Detector Output(Sigma=1.0, tl=0.02, th=0.1');
imshow(E5)
