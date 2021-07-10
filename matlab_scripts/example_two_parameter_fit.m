%
% Graphical method for chi2 fit uncertainties - 2 parameters
%

% path to data folder
data_path = 'data\';

% file names and file paths
file_name = 'exp_2param.txt';
file_path = strcat(data_path, file_name);

% read in the data
data = dlmread(file_path);

% split the data into vectors
x_data = data(:, 1);
y_data = data(:, 2);
y_err = data(:, 3);

% define the fittype for the model function
ft = fittype('b*exp(-c*x)');

% perform the chi-squared minimization
[f, gof, fit_output] = fit(x_data, y_data, ft, 'Weights', y_err.^(-2));

% extract the weighted Jacobian matrix of the model fit
J = fit_output.Jacobian;

% compute the curvature and covariance matrices
curvature_matrix = J' * J;
covariance_matrix = inv(curvature_matrix);

% create vectors for the two parameters around the best fit value
b_vec = linspace(f.b - 0.02, f.b + 0.02, 200);
c_vec = linspace(f.c - 0.02, f.c + 0.02, 200);

% make a meshgrid of the parameter vectors for 3D plotting
[B, C] = meshgrid(b_vec, c_vec);

% instantiate a matrix for chi-squared values and use two loops to compute
% the value for each pairing of parameter values from b_vec and c_vec
chi2 = zeros(size(B));
for i = 1:numel(c_vec)
    for j = 1:numel(b_vec)
        chi2(i, j) = sum( (y_data - b_vec(j)*exp(-c_vec(i)*x_data)).^2 ./ y_err.^2);
    end
end

% plot the chi squared surface as a function of the two parameters
fig2 = figure;
ax2 = axes(fig2);
surf(B, C, chi2, 'EdgeColor', 'none')
xlabel(ax2, 'b')
ylabel(ax2, 'c')
zlabel(ax2, '\chi^2')
ax2.ZLim = [gof.sse, gof.sse + 1];
ax2.View = [0, 90];

% plot the data
fig1 = figure;
ax1 = axes(fig1);
errorbar(ax1, x_data, y_data, y_err, 'k.')
ax1.XLim = [-1 11];
xlabel('X data')
ylabel('Y data')