I = imread('ntugn.jpg');

M1 = medfilt2(I, [3 3]);
figure('name','Image1 after using Median Filter[3 3]');
imshow(M1);

M2 = medfilt2(I, [5 5]);
figure('name','Image1 after using Median Filter[5 5]');
imshow(M2);


J = imread('ntusp.jpg');

N1= medfilt2(J, [3 3]);
figure('name','Image2 after using Median Filter[3 3]');
imshow(N1);

N2 = medfilt2(J, [5 5]);
figure('name','Image2 after using Median Filter[5 5]');
imshow(N2);
