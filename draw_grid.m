function grid_image = draw_grid(I)

    % To draw the grid in red, we turn the gray image into rgb
    rgbImage = cat(3, I, I, I);

    % Dialog input box for cell dimensions
    prompt = {'Cell width (in pixels):','Cell height (in pixels):'};
    title = 'Input';
    dims = [1 35];
    definput = {'10','10'};
    answer = inputdlg(prompt,title,dims,definput);
    
    % Convert input to numbers
    w = str2num(answer{1});
    h = str2num(answer{2});
    
    grid_image = rgbImage;
    
    % Paint rows red
    grid_image(1:h:end,:,1) = 255.;
    grid_image(1:h:end,:,2:end) = 0.;
    
    % Paint columns red
    grid_image(:,1:w:end,1) = 255.;
    grid_image(:,1:w:end,2:end) = 0.;
end
