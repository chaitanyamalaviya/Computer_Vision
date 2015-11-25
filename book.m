I=imread('book.jpg');
P=rgb2gray(I);
figure('name', 'Original Image');
imshow(P);
[X Y] = ginput(4);
X
Y
 
%Desired coordinates
x = [0,210,210,0];
y = [0,0,297,297];

%Building matrices v and A
v = [x(1);y(1);x(2);y(2);x(3);y(3);x(4);y(4)];

A = [X(1),Y(1),1,0,0,0,-x(1)*X(1),-y(1)*Y(1);
0,0,0,X(1),Y(1),1,-y(1)*X(1),-y(1)*Y(1);
X(2),Y(2),1,0,0,0,-x(2)*X(2),-x(2)*Y(2);
0,0,0, X(2),Y(2),1,-y(2)*X(2),-y(2)*Y(2);
X(3),Y(3),1,0,0,0,-x(3)*X(3),-x(3)*Y(3);
0,0,0, X(3),Y(3),1,-y(3)*X(3),-y(3)*Y(3);
X(4),Y(4),1,0,0,0,-x(4)*X(4),-x(4)*Y(4);
0,0,0, X(4),Y(4),1,-y(4)*X(4),-y(4)*Y(4)];


u=A\v;
U = reshape([u;1], 3, 3)'
w = U*[X'; Y'; ones(1,4)];
w = w ./ (ones(3,1) * w(3,:))
T = maketform('projective', U');
P2 = imtransform(P, T, 'XData', [0 210], 'YData', [0 297]);
figure('name', 'Transformed Image');
imshow(P2);
