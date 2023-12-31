f = @(x) [x(1)^2 - x(2) - sin(x(3)); x(1) - x(2) + sin(10*x(2)) + 20; (1 - x(1))*x(3) - 2];
J = @(x) [2*x(1), -1, -cos(x(3)); 1, -1 + 10*cos(10*x(2)), 0; -x(3), 0, 1 - x(1)];

x0_cases = [[0; 0; 0], [1; 1; 1], [1; 0.5; 1]];
tol = 1e-12;

max_iterations = 500;
n_cases = size(x0_cases, 2);
res_norm = zeros(max_iterations, n_cases);

% Iterate for each initial guess
for c = 1:n_cases
    x0 = x0_cases(:, c);
    i = 0;
    while i < max_iterations
        i = i + 1;
        % Evaluate the function and Jacobian at the current guess
        fx = f(x0);
        Jx = J(x0);

        % Compute the Newton update and update the guess
        dx = -Jx \ fx;
        x0 = x0 + dx;

        % Compute the residual norm and store it for plotting
        res_norm(i, c) = norm(fx, inf);
        if res_norm(i, c) < tol
            break;
        end
    end
end

% Plot the residual norm vs. iteration number for each case in the same plot
figure;
semilogy(1:i, res_norm(1:i, 1), 'DisplayName', ['Case 1']);
hold on;
semilogy(1:i, res_norm(1:i, 2), 'DisplayName', ['Case 2']);
semilogy(1:i, res_norm(1:i, 3), 'DisplayName', ['Case 3']);
xlabel('Iteration');
ylabel('Residual Norm');
title('Residual Norm vs. Iteration Number for Different Initial Guesses');
legend;

% Display the number of iterations for the third case
num_iterations_third_case = find(res_norm(:, 3) < tol, 1);
disp(['Number of iterations for the third case: ', num2str(num_iterations_third_case)]);


