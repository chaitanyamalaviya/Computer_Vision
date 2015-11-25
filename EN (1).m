%%
%Read in Einstein
e=double(imread('E.jpg'));
%Visulize Einstein
subplot(1,4,1);imshow(e,[]);
%His spectrum
E=fft2(e);

%Read in Newton
n=double(imread('N.jpg'));
%Visulize Newton
subplot(1,4,2);imshow(n,[]);
%His spectrum
N=fft2(n);

%Use Newton's amplitude and Einstein's phase
T=abs(N).*exp(1j*angle(E));
%Inverse FFT to go back to spatial domain, guess what you will see
t=ifft2(T);
%Visulize the result
subplot(1,4,3);imshow(real(t),[]); colormap(gray)

%Use Einstein's amplitude and Newton's phase
T=abs(E).*exp(1j*angle(N));
%Inverse FFT to go back to spatial domain, guess what you will see
t=ifft2(T);
%Visulize the result
subplot(1,4,4);imshow(real(t),[]); colormap(gray)
