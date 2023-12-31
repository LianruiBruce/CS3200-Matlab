n = 15;
H = zeros(n);
for i = 1:n
    for j = 1:n
        H(i,j) = 1 / (i + j - 1);
    end
end
x = ones(n,1);
b = H * x;
x_solve = H \ b;
dx = norm(x - x_solve);
disp("Part A result: ");
disp(dx)


% part b
n = 15;
H = zeros(n);
for i = 1:n
    for j = 1:n
        H(i,j) = 1 / (i + j - 1);
    end
end

[U, S, V] = svd(H);

subplot(2,2,1)
spy(H)
title('H')

subplot(2,2,2)
spy(S)
title('S')

subplot(2,2,3)
spy(V)
title('V')

subplot(2,2,4)
spy(U)
title('D')

disp("Part b's result are figures as showed.")

% part c
sinv = S';
for i = 1:15
    sinv(i,i) = 1.0 / S(i,i);
end
Ainv = V * sinv * U';
x_svd = Ainv * b;
error = H * x_svd - b;
norm_x = norm(error);
disp("Part C result: ")
disp(norm_x);

%part d
invS = inv(S);
accuracy = zeros(4,1);
tol = [1e-10, 1e-12, 1e-14, 1e-16];
for i = 1:length(tol)
    S_filt = S;
    invS_filt = invS;
    for j = 1:15
        if S(j,j) < tol(i)
            S_filt(j,j) = 0;
            invS_filt(j,j) = 0;
        end
    end
    Hinv = V * invS_filt * U';
    x_svd_filt = Hinv * b;
    dx_svd_filt = norm(x - x_svd_filt);
    accuracy(i) = dx_svd_filt;
end
disp("Part D result: ")
disp('Tolerance      Accuracy');
disp([tol', accuracy]);

