%
% Example multiple gaussian fit to determine
% radii of fringes/rings in an image
%

% path to data folder
data_path = 'data\';

% file names and file paths
file_name = 'rgb_noise_2.tif';
file_path = strcat(data_path, file_name);

% read the image data into an array
image_array = imread(file_path);

% average the three colour channels
intensity = mean(image_array, 3);

% grab the 10 middle rows of the intensity matrix
strip = intensity(174:183, :);

% average over rows of the narrow strip
intensity_profile = mean(strip);

% bump vectors
bump_left_ends = [7, 34, 63, 91, 119, 146, 195, 223, 250, 279, 306, 332];
bump_right_ends = [25, 53, 80, 107, 134, 162, 209, 238, 266, 294, 324, 351];
bump_centres = zeros(1, numel(bump_left_ends));
bump_widths = zeros(1, numel(bump_left_ends));

ft = fittype('a1*exp(-((x-b1)/c1)^2) + d'); % 4 parameter Gaussian
% loop over the bumps
for k = 1:numel(bump_left_ends)
    x_vector = bump_left_ends(k):bump_right_ends(k); % vector of image cols containing current bump
    y_vector = intensity_profile(x_vector); % slice out vector of intensities for current bump
    f = fit(x_vector', y_vector', ft, 'StartPoint', [1, mean(x_vector), 1, 0]); % fit a Gaussian to the slice of the profile
    bump_centres(k) = f.b1; % determine the centre of the current bump
    bump_widths(k) = f.c1/sqrt(2); % determine the width of the current bump
end

% compute the radii of the 6 fringes (from inner to outer)
fringe_left_centres = fliplr(bump_centres(1:6));
fringe_right_centres = bump_centres(7:12);
radii = (fringe_right_centres - fringe_left_centres) / 2;

% plot the intensity profile

fig1 = figure;
ax1 = axes(fig1);
hold on
plot(ax1, image_columns, intensity_profile);
%x = linspace(0,358,1000);
%y = f.a1*exp(-((x-f.b1)/f.c1).^2) + f.a2*exp(-((x-f.b2)/f.c2).^2) + f.a3*exp(-((x-f.b3)/f.c3).^2) + f.a4*exp(-((x-f.b4)/f.c4).^2) + f.a5*exp(-((x-f.b5)/f.c5).^2) +  f.a6*exp(-((x-f.b6)/f.c6).^2) +  f.a7*exp(-((x-f.b7)/f.c7).^2) +  f.a8*exp(-((x-f.b8)/f.c8).^2) +  f.a9*exp(-((x-f.b9)/f.c9).^2) +  f.a10*exp(-((x-f.b10)/f.c10).^2) +  f.a11*exp(-((x-f.b11)/f.c11).^2) +  f.a12*exp(-((x-f.b12)/f.c12).^2) + f.d;
%plot(x, y, 'r--')
ax1.FontSize = 12;
ax1.Box = 'on';
ax1.XLim = [1, 358];
ax1.YLim = [0, 160];
xlabel(ax1, 'Image column')
ylabel(ax1, 'Intensity')