function [mag, arg] = gradient(I)

    G = im2double(I);
	gradient_x_kernel = [-1 0 1];
	gradient_y_kernel = gradient_x_kernel';

	Gx = abs(filter2(gradient_x_kernel, G));
	Gy = abs(filter2(gradient_y_kernel, G));
	mag = sqrt(Gx.*Gx + Gy.*Gy);
	arg = atan(Gy./Gx); 
end