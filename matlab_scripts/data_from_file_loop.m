%
% An example script for reading data from multiple files
% that are formatted the same way.
%

% path to data folder
data_path = 'data\';

% get a vector of file objects consisting of all .txt files in the multi
% folder
files = dir(strcat(data_path, 'multi*.txt'));

% loop over the files
for file = files'
    disp(file.name)
end

%{
% loop over the files
for idx = 1:numel(files)
    
    % detetmine the relative file path
    file_path = strcat(data_path, files(idx).name);
    
    % read in the file data
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
    
    % further data processing goes here
end
%}