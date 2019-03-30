function HOG = getHogFeature(arg, mag, nb_bins)
    [h,w] = size(arg);
    HOG = zeros(1, nb_bins);
    step = floor(360/nb_bins);
    
    for i = 1:h
        for j = 1:w
           bin = floor(arg(i,j)/step)+1;
           fprintf("%f %f %f\n", HOG(bin), arg(i,j), mag(i,j));
           HOG(bin) = HOG(bin) + mag(i,j);
        end
    end
end

