A = [4 -1 0 0; -1 4 -1 0; 0 -1 4 -1; 0 0 -1 4];
b = [-1; 2; 3; 0.5];
x = zeros(size(b)); % initial guess for x
tol = 1e-6; % tolerance
maxit = 1000; % maximum number of iterations

for k = 1:maxit
    xold = x;
    for i = 1:length(b)
        x(i) = (b(i) - A(i,:)*xold + A(i,i)*xold(i)) / A(i,i);
    end
    if norm(x - xold, inf) < tol
        break;
    end
end

fprintf('Solution: x = [%f; %f; %f; %f]\n', x(1), x(2), x(3), x(4));