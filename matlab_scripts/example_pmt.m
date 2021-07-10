%
% Example pmt data
%

% path to data folder
data_path = 'data\';

% file names and file paths
file_name = 'PMT1.txt';
file_path = strcat(data_path, file_name);

% read the image data into an array
data = dlmread(file_path);

% split the data into vectors
x_data = data(:, 1);
y_data = data(:, 2);
y_err = data(:, 3);

% sort the x_data and y_data vectors in order of x_data
[x_data, order] = sort(x_data);
y_data = y_data(order);
y_err = y_err(order);

% fit lines to the rising and flat regions (including error on y)
[f1, gof1, fit_output1] = fit(x_data(40:53), y_data(40:53), 'poly1',...
    'Weights', y_err(40:53).^(-2));
[f2, gof2, fit_output2] = fit(x_data(67:100), y_data(67:100), 'poly1',...
    'Weights', y_err(67:100).^(-2));

% compute intersection point of the two lines
intersection_x = (f2.p2 - f1.p2) / (f1.p1 - f2.p1);
intersection_y = (f1.p1*f2.p2 - f2.p1*f1.p2) / (f1.p1 - f2.p1);

% create new figure and axes
fig1 = figure;
ax1 = axes(fig1);
hold on

% fit lines
x = linspace(0, 20);
y1 = f1.p1 * x + f1.p2;
y2 = f2.p1 * x + f2.p2;

% plot the pmt data
errorbar(ax1, x_data, y_data, y_err, 'LineStyle', 'None', 'Marker', '.');
plot(ax1, x, y1, 'r-');
plot(ax1, x, y2, 'r-');
plot(ax1, intersection_x, intersection_y, 'Linestyle', 'None',...
    'Marker', 'o', 'MarkerSize', 8, 'MarkerEdgeColor', 'k');
annotation(fig1, 'textarrow', [0.5, 0.56], [0.85, 0.8],...
    'String', sprintf('(%.2f, %0.2f)', intersection_x, intersection_y)); 
xlabel('Input')
ylabel('Output')
ax1.Box = 'on';
ax1.FontSize = 14;
ax1.XLim = [0, 20];
ax1.YLim = [-1, 3];