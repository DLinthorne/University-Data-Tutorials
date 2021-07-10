%
% An example script for reading data from a file.
%

% path to data folder
data_path = 'data\';

% file name and whole file path
file_name = 'gaus1.txt';
file_path = strcat(data_path, file_name);

% read in the data
data = dlmread(file_path);

% split the data into vectors
x_data = data(:, 1);
y_data = data(:, 2);
y_uncertainty = data(:, 3);

% sort the x_data, y_data, and y_uncertainty vectors
% in order of x_data
[x_data, order] = sort(x_data);
y_data = y_data(order);
y_uncertainty = y_uncertainty(order);