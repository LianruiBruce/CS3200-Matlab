A = [12 3 1 0 0 0 0 0;
     3 12 3 1 0 0 0 0;
     1 3 12 3 1 0 0 0;
     0 1 3 12 3 1 0 0;
     0 0 1 3 12 3 1 0;
     0 0 0 1 3 12 3 1;
     0 0 0 0 1 3 12 3;
     0 0 0 0 0 1 3 12];
b = [1 1 1 1 1 1 1 1]';
xtrue = A\b;

% Solve using Jacobi method
tol = 1.0e-8;
max_it = 100;
[x_jacobi, itr_jacobi, normVal_jacobi] = jacobi(A, b, tol, max_it);

% Solve using Gauss-Seidel method
[x_gs, itr_gs, normVal_gs] = gauss_seidel(A, b, tol, max_it);

% Solve using steepest_descent method
[x_sd, itr_sd, normVal_sd] = steepest_descent(A, b, tol, max_it);

% Print final solutions
fprintf('Jacobi solution: %f %f %f %f %f %f %f %f\n', x_jacobi);
fprintf('Gauss-Seidel solution: %f %f %f %f %f %f %f %f\n', x_gs);
fprintf('steepest_descent solution: %f %f %f %f %f %f %f %f\n', x_sd);

% Plot residuals
figure;
semilogy(normVal_jacobi, '-');
hold on;
semilogy(normVal_gs, '.-');
semilogy(normVal_sd, '.');
xlabel('Iteration');
ylabel('Residual');
title('Residual plot for Jacobi, Gauss-Seidel, and Steepest Descent methods');
legend('Jacobi', 'Gauss-Seidel', 'Steepest Descent');



function [x, itr, normVal] = jacobi(A, b, tol, max_it)
% Initialize the solution vector x to all zeros
x = zeros(size(A, 1), 1);

% Initialize the iteration count to zero
itr = 0;

% Initialize the error norm vector
normVal = [];

while itr < max_it
    dx = 0.5*(b-A*x); 
    x = x+dx; 
    itr=itr+1;
    normVal(itr)=norm(dx,inf); 
    
    if normVal(itr) < tol
        break
    end
end
disp("This is jacobi's method:");
disp(x);
disp("Itr of jacobi's method: " + itr);
disp("This is normVal of jacobi's method: ");
disp(normVal);
end


function [x, itr, normVal] = gauss_seidel(A, b, tol, max_it)
x = zeros(size(A, 1), 1);
itr = 0;
normVal = [];

while itr < max_it

    for i = 1:size(A, 1)
        x(i) = (b(i) - A(i, 1:i-1)*x(1:i-1) - A(i, i+1:end)*x(i+1:end)) / A(i, i);
    end

    normVal(itr+1) = norm(b - A*x, Inf);
    

    if normVal(itr+1) < tol
        break;
    end
    itr = itr + 1;
   
end
disp("This is gauss_seidel's method:");
disp(x);
disp("Itr of gauss_seidel's method: " + itr);
disp("This is normVal of gauss_seidel's method: ");
disp(normVal);
end


function [x, itr, normVal] = steepest_descent(A, b, tol, max_it)
% Implements the steepest descent algorithm to solve Ax = b.
x = zeros(size(A, 1), 1);
d = b;
itr = 0;
normVal = [];
while itr < max_it
    xold = x;
    y = A*d;
    alpha = (d'*d)/(d'*y);
    x = x + alpha*d;
    d = d - alpha*y;
    itr = itr + 1;
    normVal(itr) = norm(abs(xold - x), Inf);
    if normVal(itr) < tol
        break;
    end
end
end