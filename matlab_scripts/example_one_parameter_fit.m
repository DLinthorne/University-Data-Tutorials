%
% Graphical method for chi2 fit uncertainties - 1 parameter
%

% path to data folder
data_path = 'data\';

% file names and file paths
file_name = 'exp_1param.txt';
file_path = strcat(data_path, file_name);

% read in the data
data = dlmread(file_path);

% split the data into vectors
x_data = data(:, 1);
y_data = data(:, 2);
y_err = data(:, 3);

% define the fittype for the model function
ft = fittype('a*exp(-a*x)');

% perform the chi-squared minimization
[f, gof, fit_output] = fit(x_data, y_data, ft, 'Weights', y_err.^(-2));

% extract the weighted Jacobian matrix of the model fit
J = fit_output.Jacobian;

% compute the curvature and covariance matrices
curvature_matrix = J' * J;
covariance_matrix = inv(curvature_matrix);

% create a vector of parameter values around the best fit value
a_vec = linspace(f.a - 0.02, f.a + 0.02, 1000);

% instantiate a vector for chi-squared values and use a loop to compute
% the value for each parameter value in a_vec
chi2 = zeros(1, 1000);
for i = 1:1000
    chi2(i) = sum( (y_data - a_vec(i)*exp(-a_vec(i)*x_data)).^2 ./ y_err.^2);
end

% plot chi squared as a function of the parameter value
fig2 = figure;
ax2 = axes(fig2);
hold on
plot(a_vec, chi2)
plot(a_vec, (gof.sse+1)*ones(1, numel(a_vec)))
xlabel('a')
ylabel('\chi^2')

% plot the data
fig1 = figure;
ax1 = axes(fig1);
errorbar(ax1, x_data, y_data, y_err, 'k.')
ax1.XLim = [-1 11];
xlabel('X data')
ylabel('Y data')