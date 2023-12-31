A = [0.7577 0.7060 0.8235 0.4378 2.7260;
0.7431 0.0318 0.6948 0.3816 1.8514;
0.3922 0.2769 0.3171 0.7655 1.7518;
0.6555 0.0462 0.9502 0.7952 2.4471;
0.1712 0.0971 0.0344 0.1869 0.4896];
b = ones(size(A, 1), 1);
[Q, R] = qr(A);
subplot(1,3,1)
spy(A)
title('Matrix A')

subplot(1,3,2)
spy(Q)
title('Matrix Q')

subplot(1,3,3)
spy(R)
title('Matrix R')

%part b
A_temp = A;
Asave = A_temp;
for i = 1 : 50
    [Q1,R1] = qr(A_temp);
    A_temp = R1 * Q1;
end
A_temp
eig(Asave);


%part c
x = A \ b;
disp(x);
% part d
% compute the normal equations
ATA = A' * A;
ATb = A' * b;

% solve the normal equations
dResult = ATA \ ATb;

disp(dResult);
% part e : Solve Ax=b using QR decomposition

[Q, R] = qr(A);
y = Q' * b;
x = R \ y;
disp(x);

% f
A = [0.7577 0.7060 0.8235 0.4378 2.7260;     0.7431 0.0318 0.6948 0.3816 1.8514;     0.3922 0.2769 0.3171 0.7655 1.7518;     0.6555 0.0462 0.9502 0.7952 2.4471;     0.1712 0.0971 0.0344 0.1869 0.4896];
b = ones(size(A, 1), 1);

% solve the system using mldivide
x_mldivide = A \ b;
r_mldivide = b - A * x_mldivide;
residual_mldivide = norm(r_mldivide);

% solve the system using normal equations
ATA = A' * A;
ATb = A' * b;
x_normal = ATA \ ATb;
r_normal = b - A * x_normal;
residual_normal = norm(r_normal);

% solve the system using QR decomposition
[Q, R] = qr(A);
y = Q' * b;
x_qr = R \ y;
r_qr = b - A * x_qr;
residual_qr = norm(r_qr);

% display the residuals
disp(['Residual using multicide: ' num2str(residual_mldivide)]);
disp(['Residual using normal equations: ' num2str(residual_normal)]);
disp(['Residual using QR decomposition: ' num2str(residual_qr)]);


