function[] = stereo(imageLeft, imageRight, templatel, templatew)

k1=imread(imageLeft);
k2=imread(imageRight);
k1c=rgb2gray(k1);
k2c=rgb2gray(k2);
figure('name','Left Image');
imshow(k1c);
figure('name','Right Image');
imshow(k2c);
[r,c] = size(k1c);
dispMap=ones(r,c);
minValue=100;
matchedX=0;
for i=1+templatew:r-templatew
    for j=1+templatel:c-templatel
        leftpatch=k1c(i-templatew:i+templatew,j-templatel:j+templatel);
        for l=max(templatew+1,i-15):min(256-templatew,i+15)
            rightpatch=k2c(l-templatew:l+templatew,j-templatel:j+templatel);
            S=conv2(rightpatch.^2,ones(size(rightpatch)))-2*conv2(rightpatch,leftpatch);
            if (S<minValue)
                minValue=S;
                matchedX=l;
            end
        end
        dispMap(i,j) = i-matchedX;
    end
end
figure('name','Image 1 Result');
imshow(uint8(-dispMap),[-15,15]);
