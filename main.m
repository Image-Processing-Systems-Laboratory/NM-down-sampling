clear;
clc;

addpath('./utils/');

%% parameters for down sampling
scale = 4;                  % Scale Factor
resolution = [512 512]; % Resolution
phase = [2 2];          % Phase
sigma = 1.0;            % Sigma

lr_resolution = resolution / scale;

%% data path
gt_path = './dataset/gt/';
lr_path = './dataset/lr/';

%% gt file list
file_list = [];
file_list = [file_list; dir(fullfile(gt_path, '*.raw'))];

for i = 1:numel(file_list)
    file_info = file_list(i);
    file_path = fullfile(gt_path, file_info.name);
    disp(file_path);
    name = split(file_info.name, '_');
    lr_image_path = fullfile(lr_path, [name{1} '_' int2str(lr_resolution(1)) 'x' int2str(lr_resolution(2)) '_' name{3} '_' name{4}]);
    disp(lr_image_path);

    gt = readraw(file_path, resolution);
    lr = downsampling(gt, scale, phase, sigma);
    writeraw(lr_image_path, lr);
end

% image = readraw('../RAW/gray/barbara(512x512).raw', resolution);
% gimage = downsampling(image, s, [1, 1], 1);
% writeraw('../RAW/lr/barbara(128x128).raw', gimage);