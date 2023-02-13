fid = fopen('NIST_Filip_trim.txt','r');
yy = zeros(82,2);
ii = 0;
while ~feof(fid)
ii=ii+1;
tline = fgetl(fid);
% code to format/store tline
AAA = sscanf(tline,'%f %f');
yy(ii,1)= AAA(1,1);
yy(ii,2)= AAA(2,1);
end
fclose(fid);

sorted_data = sortrows(yy,1);
x = sorted_data(:,2);
y = sorted_data(:,1);

n = length(x);
X = zeros(n,26);
for i = 1:n
for j = 1:26
X(i,j) = x(i)^(j-1);
end
end

m_values = [5, 10, 15, 20, 25];
figure
for m = m_values
b = X(:,1:m+1)\y;
y_hat = X(:,1:m+1)*b;
E = sum((y - y_hat).^2);
k = rcond(X(1:min(n, m+1),1:min(n, m+1)));
x_eval = linspace(min(x), max(x), 1001);
X_eval = zeros(1001, m+1);
for i = 1:1001
    for j = 1:m+1
        X_eval(i,j) = x_eval(i)^(j-1);
    end
end
y_eval = X_eval*b;

subplot(2, 3, m/5 + 1)
plot(x, y, '.', x_eval, y_eval)
title(sprintf('m=%d, E=%.2e, k=%.2e', m, E, k))
xlabel('x')
ylabel('y')
disp(E);
disp(k);
end