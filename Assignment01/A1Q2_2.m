digits = [10 50 100 500];
for i = 1 : 4
tic;
piResult = compute_e(digits(i));
times = toc;
disp(piResult);
disp(times);
end

% function
function [result] = compute_e(d)
syms k;
x = (((-1).^(k)) * factorial(6 * k) * (13591409 + 545140134 * k))/((factorial(3 * k)) * ((factorial(k)).^3) * (640320).^(3 * k + 1.5));
y = symsum(x,k,0,Inf);
tem = 1 / (12 *(y));
result = vpa(tem,d); 
end


