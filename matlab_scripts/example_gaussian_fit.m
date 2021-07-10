%
% Example Gaussian fit
%

% path to data folder
data_path = 'data\';

% file names and file paths
file_name = 'gaus1.txt';
file_path = strcat(data_path, file_name);

% read in the data
data = dlmread(file_path);

% split the data into vectors
x_data = data(:, 1);
y_data = data(:, 2);

% sort the x_data and y_data vectors in order of x_data
[x_data, order] = sort(x_data);
y_data = y_data(order);

% fit a single Gaussian to the data, store the fit output
% in a variable
f = fit(x_data, y_data, 'gauss1');

% construct the independent variable vector for the fit curve.
% Evaluate the fit curve over the same range as x_data
x = linspace(x_data(1), x_data(end), 1000);

% determine the dependent variable values. We can access the fit parameter
% values using their names: f.a1, f.a2, f.a3
y = f.a1 * exp(-((x-f.b1)/f.c1).^2);

% plot the data and the fit curve
fig1 = figure;
ax1 = axes(fig1);
hold on
plot(ax1, x_data, y_data, 'k-');
plot(x, y, 'r-', 'LineWidth', 2)
ax1.FontSize = 12;
ax1.Box = 'on';
xlabel(ax1, 'Position (cm)')
ylabel(ax1, 'Intensity (W/m^2)')
legend('data', 'fit to data')
