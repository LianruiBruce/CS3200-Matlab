% import image
img = imread('CS 3200\Assignment05/image.jpg');

% convert to grayscale
gray_img = rgb2gray(img);

% calculate SVD
[U, S, V] = svd(double(gray_img));

figure(1),clf
% plot the singular values
semilogy(diag(S),'b.','markersize',20)
set(gca,'fontsize',16)
title('singular values of the image matrix')
xlabel('k'), ylabel('\sigma_k')

figure(2),clf
% plot the original image
colormap gray % add this line to use a grayscale colormap
image(gray_img)
axis equal, axis off
title('Original grayscale image', 'fontsize',16)

figure(3),clf
% plot the optimal rank-k approximation
k = 100;
Xk = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
colormap gray % add this line to use a grayscale colormap
image(uint8(Xk))
axis equal, axis off
title(sprintf('Best rank-%d approximation',k), 'fontsize',16)


% part B
% Get the size of the original image
[m, n] = size(gray_img);

% Create a random grayscale image of the same size
rand_img = rand(m, n) * 255;

% Calculate the SVD of the random grayscale image
[U_rand, S_rand, V_rand] = svd(rand_img);

% Display the random grayscale image
figure(4), clf
colormap gray
image(uint8(rand_img))
axis equal, axis off
title('Random grayscale image', 'fontsize', 16)

% Display the singular values of the random grayscale image
figure(5), clf
semilogy(diag(S_rand), 'b.', 'markersize', 20)
set(gca, 'fontsize', 16)
title('Singular values of the random image matrix')
xlabel('k'), ylabel('\sigma_k')


% part c
% Create a 2x2 subplot
figure(6), clf

% Original Image: Semilog plot of the diagonal values of S
subplot(2, 2, 1)
semilogy(diag(S), 'b.', 'markersize', 20)
set(gca, 'fontsize', 16)
title('Original Image: Singular values')
xlabel('k'), ylabel('\sigma_k')
xlim([0 1550])

% Original Image: Cumulative sum of diagonal values divided by the sum of the diagonal values
subplot(2, 2, 2)
plot(cumsum(diag(S))/sum(diag(S)))
set(gca, 'fontsize', 16)
title('Original Image: Cumulative sum')
xlabel('k'), ylabel('Cumulative sum/Total sum')
xlim([0 1550])

% Random Image: Semilog plot of the diagonal values of S_rand
subplot(2, 2, 3)
semilogy(diag(S_rand), 'b.', 'markersize', 20)
set(gca, 'fontsize', 16)
title('Random Image: Singular values')
xlabel('k'), ylabel('\sigma_k')
xlim([0 1550])

% Random Image: Cumulative sum of diagonal values divided by the sum of the diagonal values
subplot(2, 2, 4)
plot(cumsum(diag(S_rand))/sum(diag(S_rand)))
set(gca, 'fontsize', 16)
title('Random Image: Cumulative sum')
xlabel('k'), ylabel('Cumulative sum/Total sum')
xlim([0 1550])

% part d
% Create a 2x2 subplot
figure(7), clf

% Original Grayscale Image
subplot(2, 2, 1)
colormap gray
image(gray_img)
axis equal, axis off
title('Original Grayscale Image', 'fontsize', 16)

% Rank-5 Approximation
k = 5;
Xk_5 = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
subplot(2, 2, 2)
colormap gray
image(uint8(Xk_5))
axis equal, axis off
title(sprintf('Rank-%d Approximation', k), 'fontsize', 16)

% Rank-20 Approximation
k = 20;
Xk_20 = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
subplot(2, 2, 3)
colormap gray
image(uint8(Xk_20))
axis equal, axis off
title(sprintf('Rank-%d Approximation', k), 'fontsize', 16)

% Rank-100 Approximation
k = 100;
Xk_100 = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
subplot(2, 2, 4)
colormap gray
image(uint8(Xk_100))
axis equal, axis off
title(sprintf('Rank-%d Approximation', k), 'fontsize', 16)


% import image
img = imread('CS 3200\Assignment05/image.jpg');

% convert to grayscale
gray_img = rgb2gray(img);

% calculate SVD
[U, S, V] = svd(double(gray_img));

figure(1),clf
% plot the singular values
semilogy(diag(S),'b.','markersize',20)
set(gca,'fontsize',16)
title('singular values of the image matrix')
xlabel('k'), ylabel('\sigma_k')

figure(2),clf
% plot the original image
colormap gray % add this line to use a grayscale colormap
image(gray_img)
axis equal, axis off
title('Original grayscale image', 'fontsize',16)

figure(3),clf
% plot the optimal rank-k approximation
k = 100;
Xk = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
colormap gray % add this line to use a grayscale colormap
image(uint8(Xk))
axis equal, axis off
title(sprintf('Best rank-%d approximation',k), 'fontsize',16)


% part B
% Get the size of the original image
[m, n] = size(gray_img);

% Create a random grayscale image of the same size
rand_img = rand(m, n) * 255;

% Calculate the SVD of the random grayscale image
[U_rand, S_rand, V_rand] = svd(rand_img);

% Display the random grayscale image
figure(4), clf
colormap gray
image(uint8(rand_img))
axis equal, axis off
title('Random grayscale image', 'fontsize', 16)

% Display the singular values of the random grayscale image
figure(5), clf
semilogy(diag(S_rand), 'b.', 'markersize', 20)
set(gca, 'fontsize', 16)
title('Singular values of the random image matrix')
xlabel('k'), ylabel('\sigma_k')


% part c
% Create a 2x2 subplot
figure(6), clf

% Original Image: Semilog plot of the diagonal values of S
subplot(2, 2, 1)
semilogy(diag(S), 'b.', 'markersize', 20)
set(gca, 'fontsize', 16)
title('Original Image: Singular values')
xlabel('k'), ylabel('\sigma_k')
xlim([0 1550])

% Original Image: Cumulative sum of diagonal values divided by the sum of the diagonal values
subplot(2, 2, 2)
plot(cumsum(diag(S))/sum(diag(S)))
set(gca, 'fontsize', 16)
title('Original Image: Cumulative sum')
xlabel('k'), ylabel('Cumulative sum/Total sum')
xlim([0 1550])

% Random Image: Semilog plot of the diagonal values of S_rand
subplot(2, 2, 3)
semilogy(diag(S_rand), 'b.', 'markersize', 20)
set(gca, 'fontsize', 16)
title('Random Image: Singular values')
xlabel('k'), ylabel('\sigma_k')
xlim([0 1550])

% Random Image: Cumulative sum of diagonal values divided by the sum of the diagonal values
subplot(2, 2, 4)
plot(cumsum(diag(S_rand))/sum(diag(S_rand)))
set(gca, 'fontsize', 16)
title('Random Image: Cumulative sum')
xlabel('k'), ylabel('Cumulative sum/Total sum')
xlim([0 1550])

% part d
% Create a 2x2 subplot
figure(7), clf

% Original Grayscale Image
subplot(2, 2, 1)
colormap gray
image(gray_img)
axis equal, axis off
title('Original Grayscale Image', 'fontsize', 16)

% Rank-5 Approximation
k = 5;
Xk_5 = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
subplot(2, 2, 2)
colormap gray
image(uint8(Xk_5))
axis equal, axis off
title(sprintf('Rank-%d Approximation', k), 'fontsize', 16)

% Rank-20 Approximation
k = 20;
Xk_20 = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
subplot(2, 2, 3)
colormap gray
image(uint8(Xk_20))
axis equal, axis off
title(sprintf('Rank-%d Approximation', k), 'fontsize', 16)

% Rank-100 Approximation
k = 100;
Xk_100 = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
subplot(2, 2, 4)
colormap gray
image(uint8(Xk_100))
axis equal, axis off
title(sprintf('Rank-%d Approximation', k), 'fontsize', 16)


