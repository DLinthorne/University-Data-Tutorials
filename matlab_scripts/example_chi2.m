%
% Example fitting with chi2 minimization
%

% path to data folder
data_path = 'data\';

% file names and file paths
file_name = 'malus3.txt';
file_path = strcat(data_path, file_name);

% read in the data
data = dlmread(file_path);

% split the data into vectors
x_data = data(:, 1);
y_data = data(:, 2);
y_err = data(:, 3);

% sort the x_data and y_data vectors in order of x_data
[x_data, order] = sort(x_data);
y_data = y_data(order);

% define the fittype for the model function
ft = fittype('a1*(sin(a2*x+a3))^2 + a4');

% perform the chi-squared minimization
[f, gof, fit_output] = fit(x_data, y_data, ft,...
    'Weights', y_err.^(-2), 'StartPoint', [2, 1, +pi/4, -1]);

% extract the weighted Jacobian matrix of the model fit
J = fit_output.Jacobian;

% compute the curvature and covariance matrices
curvature_matrix = J' * J;
covariance_matrix = inv(curvature_matrix);

% plot malus data with sine squared fit
fig1 = figure;
ax1 = axes(fig1);
errorbar(ax1, x_data, y_data, y_err, 'k.');
hold on
x = linspace(x_data(1), x_data(end), 1000);
y = f.a1 * (sin(f.a2*x + f.a3)).^2 + f.a4;
plot(ax1, x, y, 'r-', 'LineWidth', 2)
xlabel(ax1, 'Position (cm)')
ylabel(ax1, 'Intensity (W/m^2)')
legend(ax1, 'Data', 'Fitted curved', 'Location', 'southwest')

% calculate the minimum chi-squared value
min_chi2 = gof.sse;

% get the number of degrees of freedom
ndof = gof.dfe;

% calcualte the p-value and reduced chi-squared statistic
p_value = chi2cdf(min_chi2, ndof, 'upper'); % ndof = 100 - 4 = 96
reduced_chi2 = min_chi2/ndof;