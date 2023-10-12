function writeraw(path, image)
    
    f = fopen(path, "w");
    image = image';

    fwrite(f, image(:), 'uint8');
    fclose(f);

