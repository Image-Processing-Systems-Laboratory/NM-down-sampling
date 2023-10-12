function lr = downsampling(image, scale, phase, sigma)

    py = phase(1);
    px = phase(2);
    
    fs = scale + 1;
    
    gfilter = fspecial('gaussian', [fs, fs], sigma);
    gimage = imfilter(image, gfilter);
    
    lr = gimage(py:scale:end, px:scale:end);