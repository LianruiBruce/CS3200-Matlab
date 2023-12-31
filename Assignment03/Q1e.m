B = bucky;
% LU decomposition
[L1,U1] = lu(B);

% LUP decomposition
[L, U, P, Q] = lu(B);

% Create a 2x2 subplot
subplot(2,2,1)
plot(L1)
title('L from LU')
subplot(2,2,2)
plot(U1)
title('U from LU')
subplot(2,2,3)
plot(L)
title('L from LUP')
subplot(2,2,4)
plot(U)
title('U from LUP')
