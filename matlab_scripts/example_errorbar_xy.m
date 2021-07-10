%
% A plotting example with vertical and horizontal error bars
%

% create x and y data vectors
x = linspace(-5, 5, 15);
y = x.^2;

% create a vector of uncertainties for the y data (1.5 for all points)
y_err = ones(1, numel(x))*1.5;

% create a vector of uncertainties for the x data (0.2 for all points)
x_err = ones(1, numel(x))*0.2;

% plot the data with x and y error bars
fig1 = figure;
ax1 = axes(fig1);
errorbar(ax1, x, y, y_err, y_err, x_err, x_err,...
    'LineStyle', 'none', 'Marker', 'o');
ax1.XLim = [-6 6];