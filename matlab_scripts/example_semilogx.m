%
% semilogx example
%

% x and y vectors
x = linspace(1,1000);
y = log(x);

% linear plot
fig1 = figure;
ax1 = axes(fig1);
plot(ax1, x, y);
title(ax1, 'Linear plot')

% semilogx plot
fig2 = figure;
ax2 = axes(fig2);
semilogx(ax2, x, y);
title(ax2, 'Semi Log x plot')
