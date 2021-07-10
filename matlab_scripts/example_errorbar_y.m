%
% A plotting example with vertical error bars
%

% create x and y data vectors
x = linspace(-5, 5, 15);
y = x.^2;

% create a vector of uncertainties for the y data (1.5 for all points)
y_err = ones(1, numel(x))*1.5;

% plot the data with y error bars only
fig1 = figure;
ax1 = axes(fig1);
errorbar(ax1, x, y, y_err, 'LineStyle', 'none', 'Marker', 'o');
ax1.XLim = [-6 6];