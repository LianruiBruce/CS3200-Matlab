%% Steepest Descent example
A = randi([1, 1000], 2, 2);
b = randi([1, 1000], 2, 1);
x = zeros(2, 1);
d = b;
normVal = Inf;
alpha = 0.0;
itr = 0;
tol = 0.1e-3;

% Initialize record matrix for storing x values at each iteration
record = zeros(itr, 2);

% Algorithm: Steepest Descent
fprintf('Iteration\t  x(1)\t\t x(2)\t\t d(1)\t\t d(2)\t\t alpha\n');
while normVal > tol
    xold = x;
    y = A * d;
    alpha = (d' * d) / (d' * y);
    x = x + alpha * d;
    d = d - alpha * y;
    itr = itr + 1;
    normVal = abs(xold - x);
    fprintf(' %i   %6.3f   %6.3f   %6.3f   %6.3f   %6.3f \n',itr,x(1),x(2),d(1),d(2),alpha)
    
    % Store current x value in record matrix
    record(itr, :) = x';
end

% Calculate true value of x
x_true = A \ b;

% Print final result and plot x values at each iteration
fprintf('Solution of the system is : \n%f %f\nresidual %f %f\nin %d iterations\nTrue x value: %f %f\n', x(1), x(2), normVal, itr, x_true(1), x_true(2));
figure;
plot(record(:, 1), record(:, 2), '--o', 'LineWidth', 1.5, 'MarkerSize', 7);
hold on;
plot(x_true(1), x_true(2), 'ro', 'MarkerSize', 7, 'MarkerFaceColor', 'r');
title('Gradient Descent Progress');
xlabel('x(1)');
ylabel('x(2)');
legend('Approximate x', 'True x', 'Location', 'northwest');
