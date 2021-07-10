%
% Example reading in greyscale image
%

% path to data folder
data_path = 'data\';

% file names and file paths
file_name = 'Gray_noise_1.tiff';
file_path = strcat(data_path, file_name);

% read the image data into an array
image_array = imread(file_path);

% display the image
imagesc(image_array)
colormap(gray) % change the colormap
colorbar % add a colorbar
axis equal % make the width and height of pixels equal