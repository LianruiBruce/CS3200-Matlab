s = [4 0 0 0; 0 4 0 0; 0 0 4 0; 0 0 0 2];
t = [0 4 2 0; 4 0 1 0; 2 1 0 2; 0 0 2 0];
a = inv(s)*t;
%b = a*t;
normA = norm(a, 1);
disp(a)
disp(normA)