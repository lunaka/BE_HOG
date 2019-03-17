%% Class: Capteurs et traitement d'images - BE HOG
% Authors: Natália Gubiani Rampon
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

subplot(1,3,1); imshow(G); title('VRUM VRUM');
subplot(1,3,2); imshow(mag); title('Magnitude');
subplot(1,3,3); imshow(argumentPainted); title('Argument');