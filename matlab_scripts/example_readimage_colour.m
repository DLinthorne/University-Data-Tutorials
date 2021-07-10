%
% Example reading in colour image
%

% path to data folder
data_path = 'data\';

% file names and file paths
file_name = 'rgb_noise_2.tif';
file_path = strcat(data_path, file_name);

% read the image data into an array
image_array = imread(file_path);

% extract the r, g, b channels
red_channel = image_array(:,:,1);
green_channel = image_array(:,:,2);
blue_channel = image_array(:,:,3);

% take the mean over the third dimension
intensity = mean(image_array, 3);

% display the mean of the channels
imagesc(intensity)
colormap(gray)
colorbar
axis equal