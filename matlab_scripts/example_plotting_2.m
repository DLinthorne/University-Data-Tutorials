%
% Plotting example with figure, axes, and plot objects
% stored in variables
%

% path to data folder
data_path = 'data\';

% file names and file paths
file_name1 = 'gaus1.txt';
file_name2 = 'gaus2.txt';
file_path1 = strcat(data_path, file_name1);
file_path2 = strcat(data_path, file_name2);

% read in the data
data1 = dlmread(file_path1);
data2 = dlmread(file_path2);

% split the data into vectors
x_data1 = data1(:, 1);
y_data1 = data1(:, 2);
x_data2 = data2(:, 1);
y_data2 = data2(:, 2);

% sort the x_data and y_data vectors in order of x_data
[x_data1, order1] = sort(x_data1);
y_data1 = y_data1(order1);
[x_data2, order2] = sort(x_data2);
y_data2 = y_data2(order2);

% create new figure and axes
fig1 = figure;
ax1 = axes(fig1);
hold on

% plot the gaus data
p1 = plot(ax1, x_data1, y_data1, 'LineWidth', 2);
p2 = plot(ax1, x_data2, y_data2, 'LineStyle', '--', 'LineWidth', 1);
xlabel(ax1, 'Position (cm)')
ylabel(ax1, 'Intensity (W/m^2)')

% adjust axes properties
ax1.XLim = [0, 6.5];
ax1.YLim = [-0.2, 2.2];

ax1.Box = 'on';
%ax1.YTick = 0:0.25:2.25;
ax1.TickDir = 'out';
%ax1.YTickLabelRotation = 45;
ax1.XMinorTick = 'on';
ax1.YMinorTick = 'on';
ax1.TickLength = [0.02, 0.04];

ax1.XGrid = 'on';
ax1.YGrid = 'on';

ax1.FontName = 'times new roman';
ax1.FontSize = 14;

% label the curves
%legend(ax1, 'gaus1', 'gaus2', 'Location', 'northeast')
annotation(fig1, 'textarrow', [0.3, 0.35], [0.57, 0.47],...
    'String', 'gaus1', 'FontSize', 12);
annotation(fig1, 'textarrow', [0.6, 0.53], [0.6, 0.5],...
    'String', 'gaus2', 'FontSize', 12);

% save figure as a .png file
saveas(fig1, 'gausdata.png')