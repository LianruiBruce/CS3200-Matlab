% Part a
syms y x
y(x) = random_poly;

% Part b
w = 0.5:0.01:5.5;
v = double(y(w));

% Part c
figure;
% Loop through n values
for n = 1:10
    % Create n+1 evenly spaced points between 0.5 and 5.5
    x_points = linspace(0.5, 5.5, n+1);
    y_points = double(y(x_points));
    
    % Part d
    plot(w, v, 'LineWidth', 3);
    hold on;

    % Part e
    plot_handle = plot(x_points, y_points, 'o', 'LineWidth', 1.5, 'MarkerSize', 7);
    color = get(plot_handle, 'Color');

    % Part f
    interpolated_y = polyinterp(x_points, y_points, w);
    plot(w, interpolated_y, 'LineWidth', 1.5, 'Color', color);

    % Part g
    xlim([0, 6]);
    title(['Interpolation with n = ', num2str(n)]);
    legend({'True function', 'Sample points', 'Interpolated function'}, 'Location', 'northoutside');

    % Part h
    pause(0.5);
    hold off;
end
