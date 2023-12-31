B = bucky;
b = ones(size(B));
disp(b)
disp(B)
spy(B)
[L1,U1,P1] = lu(B);
disp('Here is the LU of B: ')
disp('Here is the L1 of B')
disp(L1)
disp('Here is the U1 of B')
disp(U1)

disp('Now is LUP B')
B = bucky;

% Perform LUP decomposition
[L, U, P, Q] = lu(B, 'vector');

% Convert permutation vectors to matrices
P = sparse(1:size(B,1), P, 1);
Q = sparse(Q, 1:size(B,2), 1);

% Print the resulting matrices
disp('L = ');
disp(L);
disp('U = ');
disp(U);
disp('P = ');
disp(P);
disp('Q = ');
disp(Q);

