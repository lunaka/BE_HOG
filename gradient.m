function [mag, arg] = gradient(I)

    G = im2double(I);
	gradient_x_kernel = [-1 0 1];
	gradient_y_kernel = gradient_x_kernel';

	Ix = imfilter(G, gradient_x_kernel);
	Iy = imfilter(G, gradient_y_kernel);
	mag = sqrt(Ix.*Ix + Iy.*Iy); %magnitude
    mag = uint8(mag);
	arg_rad = atan2(Iy, Ix); %argument == angle in radians
	arg_deg = arg_rad*180/pi; %argument in degrees in the range [-180, 180]
	arg_deg(arg_deg < 0) = arg_deg(arg_deg < 0) + 360; %translates so that range is in [0, 360]
	arg = arg_deg;
end