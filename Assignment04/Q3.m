% Define birth and death rates
b = [0.3, 0.3, 0.3, 0.1];
d = [0.1, 0.2, 0.5, 0.9];

L = [0.3 0.3 0.3 0.1 ;    0.9 0 0 0 ;    0 0.8 0 0 ;    0 0 0.5 0.1 ];

% Find the largest eigenvalue using eig
[V, D] = eig(L);
eigenvalues = diag(D);
largest_eigenvalue = max(eigenvalues);

P0 = [100; 200; 150; 75];

% Find the population at year 1000
L1000 = L^1000;
P1000 = L1000 * P0;

d_new = [0.1, 0.2, 0.5, 0.01];
L_new =[0.3 0.3 0.3 0.1 ;    0.9 0 0 0 ;    0 0.8 0 0 ;    0 0 0.5 0.99];

L_new1000 = L_new^1000;
P_new1000 = L_new1000 * P0;
% Find the new largest eigenvalue using eig
[V_new, D_new] = eig(L_new);
eigenvalues_new = diag(D_new);
largest_eigenvalue_new = max(eigenvalues_new);

% Display results
fprintf('Largest eigenvalue (original): %f\n', largest_eigenvalue);
fprintf('Population at year 1000:\n');
disp(P1000);
fprintf('Largest eigenvalue (new death rate): %f\n', largest_eigenvalue_new);
disp(P_new1000);

