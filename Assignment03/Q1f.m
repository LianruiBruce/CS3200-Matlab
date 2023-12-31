% Define the matrix B and the right-hand side vector b
B = bucky;
b = ones(size(B, 1), 1);

% Perform LU decomposition with partial pivoting
[L, U, P] = lu(B);

% Solve for y using forward substitution
y = L \ (P * b);

% Solve for x using backward substitution
x = U \ y;
disp(x);

% get other result to check method
r = B * x - b;

% Check if the residual vector is close to zero
tol = 1e-10;
if norm(r) < tol
    disp('Solution is accurate');
else
    disp('Solution may be inaccurate');
end