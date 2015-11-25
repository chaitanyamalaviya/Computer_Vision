%Part a:

P=imread('macritchie.jpg');
Pc=rgb2gray(P);
E = edge(Pc,'canny',[0.01 0.1],1.0);

%Part b:

[H, xp] = radon(E);
figure('name','Hough Transform as image');
imagesc(H); 
colormap('hot');
xlabel('\theta (degrees)'); ylabel('x\');
title('Hough Transform');
colorbar
% figure('name', 'Hough Transform displayed as image');
% imshow(H);

%Part c:

[Houghmax,index] = max(H(:));
[m,n] = ind2sub(size(H),index);
radius=xp(m);
theta=n;
[theta,radius]

%Part d:

[A, B] = pol2cart(theta*pi/180, radius);
B=-B;
[A B]
C=(A*radius*cos(theta*pi/180))+(-B*radius*sin(theta*pi/180));
C
%Part e:

imsize = size(Pc);
xl=0; xr=imsize(2)-1;
yl=((C-A*xl)/B)+188;
yr=((C-A*xr)/B)+188;

%Part f:
figure('name', 'Superimposing estimated line on original image');
imshow('macritchie.jpg');
k=line([xl xr], [yl yr],'LineWidth',3);
