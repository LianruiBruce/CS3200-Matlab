% Part (a)
A = [1 2 3; 4 5 6; 7 8 9];
x0 = [1; 1; 1];
tolerance = 0.1e-3;
max_iters = 100;
[x_a, lam_a, success_a] = power_method(A, x0, tolerance, max_iters);

[V_a, D_a] = eig(A);
eig_A = diag(D_a);

% Part (b)
B = [2 3 2; 1 0 -2; -1 -3 -1];
x0_b = [2; 3; 2];
[V_b, D_b] = eig(B);
eig_B = diag(D_b);

[x_b, lam_b, success_b] = power_method(B, x0_b, tolerance, max_iters);

% Part (c)
x0_c = [1; -1; 1];

[x_c, lam_c, success_c] = power_method(B, x0_c, tolerance, max_iters);

% Part (d)
x0_d = [1; 1; 1];
% Modify power_method function for A inverse
[x_d, lam_d, success_d] = power_method_smallest(A, x0_d, tolerance, max_iters);

smallest_eigenvalue_A = lam_d;

% Display results
fprintf('Part (a): Largest eigenvalue of A (Power Method) = %f\n', lam_a);
fprintf('Eigenvalues of A (MATLAB eig) =\n');
disp(eig_A');

disp("Part b: Fail to converge(Eigen Value):");
disp(eig_B');

fprintf('\nPart (c): Largest eigenvalue of A with starting vector [1; -1; 1] (Power Method) = %f\n', lam_c);

fprintf('\nPart (d): Smallest eigenvalue of A (Power Method with A inverse) = %f\n', smallest_eigenvalue_A);

function [x, lam, success] = power_method(A, x0, tolerance, max_iters)
    x_prev = x0;
    success = 0;

    for k = 1:max_iters
        y = A * x_prev;
        x = y / norm(y, inf);

        if norm(x - x_prev, inf) < tolerance
            success = 1;
            break
        end
        x_prev = x;
    end
    
    lam = x' * A * x / (x' * x); % Rayleigh Quotient

    if success == 0
        fprintf('Power method failed to converge in %d iterations\n', max_iters);
    else
        fprintf('Converged in %d iterations\nEigen Vector is [%e, %e]^T, value is %e\n', k, x(1), x(2), lam);
    end
end

function [x, lam, success] = power_method_smallest(A, x0, tolerance, max_iters)
    x_prev = x0;
    success = 0;

    for k = 1:max_iters
        y = A \ x_prev;
        x = y / norm(y, inf);

        if norm(x - x_prev, inf) < tolerance
            success = 1;
            break
        end
        x_prev = x;
    end
    
    lam = x' * A * x / (x' * x); % Rayleigh Quotient

    if success == 0
        fprintf('Power method failed to converge in %d iterations\n', max_iters);
    else
        fprintf('Converged in %d iterations\nEigen Vector is [%e, %e]^T, value is %e\n', k, x(1), x(2), lam);
    end
end


