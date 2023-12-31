f = @(x) [x(1)^2 + x(2) - 33; x(1) - x(2)^2 - 4; x(1) + x(2) + x(3)];
J = @(x) [2*x(1), 1, 0; 1, -2*x(2), 0; 1, 1, 1];
x0 = [0; 0; 0];
tol = 1e-15;
max_iterations = 500;
res_norm = zeros(max_iterations, 1);

% Iterate using Newton's Method
for i = 1:max_iterations
    % Evaluate the function and Jacobian at the current guess
    fx = f(x0);
    Jx = J(x0);    
    % Compute the Newton update and update the guess
    dx = -Jx \ fx;
    x0 = x0 + dx;
    
    % Compute the residual norm and store it for plotting
    res_norm(i) = norm(fx, inf);
    if res_norm(i) < tol
        disp(x0);
        disp("Here is the iteration time: ");
        disp(i);
        break;
    end
end

% Plot the residual norm vs. iteration number
plot(1:i, res_norm(1:i));
xlabel('Iteration');
ylabel('Residual Norm');
title('Residual Norm vs. Iteration Number');



