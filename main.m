
G = imread('car1.bmp');
[mag,arg] = gradient(G);

subplot(1,2,1); imshow(G); title('VRUM VRUM');
subplot(1,2,2); imshow(mag); title('Magnitude');