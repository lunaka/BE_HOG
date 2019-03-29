function [HOG_image,cells] = draw_HOG(I, arg)

    figure;
    rgbImage = cat(3, I, I, I);
    ax = axes('pos', [-0.1 -0.1 1.4 1.4]);
    image(ax,'CData',rgbImage,'XData',[-0.1 1.4],'YData',[1.4 -0.1]);
    hold on;
    box off;

    % Dialog input box for cell dimensions
    prompt = {'Cell width (in pixels):','Cell height (in pixels):', 'Number of bins per cell:'};
    title = 'Input';
    dims = [1 35];
    definput = {'16','16','9'};
    answer = inputdlg(prompt,title,dims,definput);
    
    % Convert input to numbers
    cell_width = str2num(answer{1});
    cell_height = str2num(answer{2});
    nb_bins = str2num(answer{3});

    [h,w] = size(I);

    nb_h = h/cell_height;
    nb_w = w/cell_width;
    nb_cells = ceil(nb_h)*ceil(nb_w);
    cells = zeros(nb_cells,nb_bins);
    counter = 1;
    
    for i = 1:cell_height:h
        for j = 1:cell_width:w
            
            limit_i = i+cell_height;
            limit_j = j+cell_width;
            
            if limit_i > h
                limit_i = h;
            end
            
            if limit_j > w
                limit_j = w;
            end
  
            ax = axes('pos', [i/h j/w (limit_i-i)/h (limit_j-j)/w]);
            fprintf("%f %f %f %f\n", i/h, j/w, (limit_i-i)/h, (limit_j-j)/w);
            hist1 = histogram(ax, arg(i:limit_i, j:limit_j), nb_bins, 'EdgeColor', 'none', 'FaceColor','red')
            cells(counter,:) = hist1.Values;
            counter = counter + 1;
            alpha(hist1,.7);
            set(gca,'color','none')
            set(ax,'Visible','off')
            set(ax,'YTickLabel',[]);
            set(ax,'XTickLabel',[]);
            
        end
    end

    HOG_image = I;
    hold off;
end

