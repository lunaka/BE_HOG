function B_n_Y = color_by_orientation(I, arg)

	[h, w] = size(I); 
	rgbImage = cat(3, I, I, I);

	for r = 1 : h
		for c = 1 : w

			if arg(r,c) >= 0 && arg(r,c) <= 180
				% Paint it yellow
                rgbImage(r, c, :) = [255., 255., 0.];
			else
				% Paint it blue
                rgbImage(r, c, :) = [0., 0., 255.];
			end
		end
	end

	B_n_Y = rgbImage;
end