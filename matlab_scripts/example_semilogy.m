%
% semilogy example
%

% x and y vectors
x = linspace(1,5);
y = exp(x);

% linear plot
fig1 = figure;
ax1 = axes(fig1);
plot(ax1, x, y);
title(ax1, 'Linear plot')

% semilogy plot
fig2 = figure;
ax2 = axes(fig2);
semilogy(ax2, x, y);
title(ax2, 'Semi Log y plot')
