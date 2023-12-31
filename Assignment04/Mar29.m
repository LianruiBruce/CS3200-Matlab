% Define the matrix A
A = [1 4; 1 1];

% Perform the Gram-Schmidt process to orthogonalize A
u1 = A(:,1) / norm(A(:,1));
v2 = A(:,2) - u1' * A(:,2) * u1;
u2 = v2 / norm(v2);
Q = [u1 u2];

% Compute the matrix R
x = sym('x');
B = [1 x; 1 x];
C = [1 4; 1 1];
M = C * inv(B);
[a, b, c] = solve(M(1,1)+M(1,2)*x==1/sqrt(2)*(x+1), M(2,2)*x==-1/sqrt(10)*(3*x+1), 'a', 'b', 'c');
R = [a b; 0 c];

% Verify that Q*R = A
disp('Q*R = ');
disp(Q*R);
disp('A = ');
disp(A);
