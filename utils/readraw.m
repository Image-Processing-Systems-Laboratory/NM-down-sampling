function image = readraw(path, resolution)

    h = resolution(1);
    w = resolution(2);
    
    f = fopen(path, "r");
    image = fread(f, w * h, 'uint8=>uint8');
    fclose(f);

    image = reshape(image, [h, w]);
    image = image';