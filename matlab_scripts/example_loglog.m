%
% loglog example
%

% x and y vectors
x = logspace(1,3, 100);
y = x.^3;

% linear plot
fig1 = figure;
ax1 = axes(fig1);
plot(ax1, x, y);
title(ax1, 'Linear plot')

% loglog plot
fig2 = figure;
ax2 = axes(fig2);
loglog(ax2, x, y);
title(ax2, 'log log plot')
