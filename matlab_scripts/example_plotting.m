%
% A basic plotting example
%

% create the x and y vectors for a 1 Hz sine wave
% from 0 to 2 seconds with amplitude 20 V
time = linspace(0, 2, 1000); % time vector
voltage = 20*sin(2*pi*time); % corresponding voltage vector

% plot voltage vs time
fig2 = figure;
ax = axes;
plot(time, voltage, 'Marker', 'o', 'MarkerIndices', 1:50:1000,...
     'LineWidth', 2, 'Color', [0.2590, 0.5098, 0.4275],...
     'MarkerFaceColor', 'red', 'MarkerEdgeColor', 'k', 'MarkerSize', 8)

% add axis labels
xlabel('time (s)')
ylabel('voltage (V)')