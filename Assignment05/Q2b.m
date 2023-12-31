% part b
% temperature data
temp = [-0.8 2.1 7.2 10.5 15.9 21.5 26.8 24.7 19.8 12 4.9 -0.5]';
months = (1:12)';
n = length(months);

% design matrix for linear model
X1 = [ones(n, 1) months];

% design matrix for quadratic model
X2 = [ones(n, 1) months months.^2];

% design matrix for cubic model
X3 = [ones(n, 1) months months.^2 months.^3];

% design matrix for quartic model
X4 = [ones(n, 1) months months.^2 months.^3 months.^4];

% compute QR decomposition for each model
[Q1, R1] = qr(X1, 0);
[Q2, R2] = qr(X2, 0);
[Q3, R3] = qr(X3, 0);
[Q4, R4] = qr(X4, 0);

% compute Q^T y for each model
QTy1 = Q1' * temp;
QTy2 = Q2' * temp;
QTy3 = Q3' * temp;
QTy4 = Q4' * temp;

% solve upper triangular system for each model
x1 = R1 \ QTy1;
x2 = R2 \ QTy2;
x3 = R3 \ QTy3;
x4 = R4 \ QTy4;

% construct lines of fit for each model
y1 = x1(1) + x1(2) * months;
y2 = x2(1) + x2(2) * months + x2(3) * months.^2;
y3 = x3(1) + x3(2) * months + x3(3) * months.^2 + x3(4) * months.^3;
y4 = x4(1) + x4(2) * months + x4(3) * months.^2 + x4(4) * months.^3 + x4(5) * months.^4;

% plot the different lines of fit
subplot(2, 2, 1)
plot(months, temp, '*b')
hold on
plot(months, y1, 'r')
xlabel('Month')
ylabel('Temperature (°C)')
title('Line of Best Fit')

subplot(2, 2, 2)
plot(months, temp, '*b')
hold on
plot(months, y2, 'g')
xlabel('Month')
ylabel('Temperature (°C)')
title('Quadratic of Best Fit')

subplot(2, 2, 3)
plot(months, temp, '*b')
hold on
plot(months, y3, 'm')
xlabel('Month')
ylabel('Temperature (°C)')
title('Cubic of Best Fit')

subplot(2, 2, 4)
plot(months, temp, '*b')
hold on
plot(months, y4, 'k')
xlabel('Month')
ylabel('Temperature (°C)')
title('Quartic of Best Fit')

% calculate 2-norm of residual for linear model
resid1 = norm(temp - y1);

% calculate 2-norm of residual for quadratic model
resid2 = norm(temp - y2);

% calculate 2-norm of residual for cubic model
resid3 = norm(temp - y3);

% calculate 2-norm of residual for quartic model
resid4 = norm(temp - y4);

% print results
fprintf('2-Norm of Residual:\n')
fprintf('Linear Model: %.4f\n', resid1)
fprintf('Quadratic Model: %.4f\n', resid2)
fprintf('Cubic Model: %.4f\n', resid3)
fprintf('Quartic Model: %.4f\n', resid4)