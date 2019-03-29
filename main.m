%% Class: Capteurs et traitement d'images - BE HOG
% Authors: Natalia Gubiani Rampon
%		   Lucas Neto Nakadaira
%
% HOG (Histogram of Oriented Gradient) descriptors algorithm implementation
% for object detection in images as proposed by Dalal, N. Triggs, B. : 
% Histograms of oriented gradients for human detection, IEEE Computer Society 
% Conference on Computer Vision and Pattern Recognition, 2005.
%%

clear all;

input_file = 'car1.bmp';

G = imread(input_file);
[mag,arg] = gradient(G);

argumentPainted = color_by_orientation(G, arg);

gridImage = draw_grid(G);

figure;
subplot(2,3,1); imshow(G); title('VRUM VRUM');
subplot(2,3,2); imshow(mag); title('Magnitude');
subplot(2,3,3); imshow(argumentPainted); title('Argument');
subplot(2,3,[4,6]); imshow(gridImage); title('Grided Image');

[HOG,cells] = draw_HOG(G,arg);

%% Partie 2
clear all
close all

I = imread('hog_similar.bmp');
I1 = I(end-127:end,1:64);
I2 = I(end-127:end,91:154);
figure,subplot(1,2,1),imshow(I1),subplot(1,2,2),imshow(I2)

[G1,O1] = gradient(I1);
[G2,O2] = gradient(I2);

[flango,h1] = draw_HOG(I1,O1);
[flango,h2] = draw_HOG(I2,O2);
% h1 = cell_division(I1);
% h2 = cell_division(I2);
h1 = double(reshape(h1,1,[]));
h2 = double(reshape(h2,1,[]));

similarity = dot(h1,h2)/(norm(h1)*norm(h2))

% h1 = block_division(I1,O1);
% h2 = block_division(I2,O2);
% h1 = reshape(h1,1,[]);
% h2 = reshape(h2,1,[]);
% 
% similarity_normalized = dot(h1,h2)/(norm(h1)*norm(h2))