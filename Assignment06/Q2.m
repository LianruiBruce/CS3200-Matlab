% Define Runge function
syms f(x)
f(x) = 1 / (1 + 25*x^2);

% Create 1000 points in the interval [-1, 1]
np = 1000;
x_vals = linspace(-1, 1, np);

% Evaluate the Runge function at these points
y_vals = double(f(x_vals));

% Plot the Runge function
figure;
plot(x_vals, y_vals, 'LineWidth', 2);
title('Runge Function and Interpolations with Chebyshev Nodes');
xlabel('x');
ylabel('f(x)');
hold on;

% Interpolation degrees
degrees = [4, 8, 12, 16, 24];

for n = degrees
    % Create n Chebyshev nodes in the interval [-1, 1]
    k = 1:n;
    x_points = cos(((2 * k - 1) * pi) / (2 * n));
    y_points = double(f(x_points));

    % Polyinterp method
    interpolated_y_polyinterp = polyinterp(x_points, y_points, x_vals);

    % Barylag method
    data = [x_points', y_points'];
    interpolated_y_barylag = barylag(data, x_vals');

    % Vandermonde matrix method
    A = fliplr(vander(x_points));
    coeffs = A \ y_points';
    interpolated_y_vander = polyval(coeffs, x_vals);

    % Calculate L1, L2, and Linf norm errors
    L1_polyinterp = norm(y_vals - interpolated_y_polyinterp, 1);
    L2_polyinterp = norm(y_vals - interpolated_y_polyinterp, 2);
    Linf_polyinterp = norm(y_vals - interpolated_y_polyinterp, Inf);
    
    L1_barylag = norm(y_vals - interpolated_y_barylag', 1);
    L2_barylag = norm(y_vals - interpolated_y_barylag', 2);
    Linf_barylag = norm(y_vals - interpolated_y_barylag', Inf);
    
    L1_vander = norm(y_vals - interpolated_y_vander, 1);
    L2_vander = norm(y_vals - interpolated_y_vander, 2);
    Linf_vander = norm(y_vals - interpolated_y_vander, Inf);
    
    % Print errors
    fprintf('Degree: %d\n', n);
    fprintf('Polyinterp L1: %.6f, L2: %.6f, Linf: %.6f\n', L1_polyinterp, L2_polyinterp, Linf_polyinterp);
    fprintf('Barylag L1: %.6f, L2: %.6f, Linf: %.6f\n', L1_barylag, L2_barylag, Linf_barylag);
    fprintf('Vandermonde L1: %.6f, L2: %.6f, Linf: %.6f\n\n', L1_vander, L2_vander, Linf_vander);
    
% Plot interpolated functions and points
plot(x_vals, interpolated_y_polyinterp, 'LineWidth', 1.5);
plot(x_vals, interpolated_y_barylag', '--', 'LineWidth', 1.5);
plot(x_vals, interpolated_y_vander, ':', 'LineWidth', 1.5);
end

legend('Runge Function', 'Points', 'Polyinterp', 'Barycentric Lagrange', 'Vandermonde');
hold off;

