n = 100;
pi_approx = vpa(0,100);
pi_approx_sum = vpa(0,100);

for k = 0:n
    term = (((-1).^(k)) * factorial(6 * k) * (13591409 + 545140134 * k))/((factorial(3 * k)) * ((factorial(k)).^3) * (640320).^(3 * k + 1.5)); 
    pi_approx_sum = pi_approx_sum + term;
    pi_approx = 1/(pi_approx_sum*12);
   if abs(pi_approx - pi) < eps
     break;
   end
end
disp(vpa(pi));
fprintf('Number of iterations: %d\n', k);
fprintf('Final approximation of pi: %.20f\n', pi_approx);

