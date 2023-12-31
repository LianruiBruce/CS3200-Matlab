% Load the original color image
img = imread('CS 3200\Assignment05/image.jpg');

% Calculate SVD for each color channel
[U_r, S_r, V_r] = svd(double(img(:,:,1)));
[U_g, S_g, V_g] = svd(double(img(:,:,2)));
[U_b, S_b, V_b] = svd(double(img(:,:,3)));

% Choose different values for rank-k to experiment with compression
k_values = [5, 20, 100];

% Display the original color image and compressed images for different values of k
figure(1), clf
subplot(2, 2, 1)
image(img)
axis equal, axis off
title('Original Color Image', 'fontsize', 16)

for i = 1:length(k_values)
    k = k_values(i);
    img_k = reconstruct_color_image(U_r, S_r, V_r, U_g, S_g, V_g, U_b, S_b, V_b, k);
    
    subplot(2, 2, i + 1)
    image(img_k)
    axis equal, axis off
    title(sprintf('Rank-%d Approximation', k), 'fontsize', 16)
end
% Create a function to reconstruct the color image using rank-k approximations
function img_k = reconstruct_color_image(U_r, S_r, V_r, U_g, S_g, V_g, U_b, S_b, V_b, k)
    img_r_k = U_r(:, 1:k) * S_r(1:k, 1:k) * V_r(:, 1:k)';
    img_g_k = U_g(:, 1:k) * S_g(1:k, 1:k) * V_g(:, 1:k)';
    img_b_k = U_b(:, 1:k) * S_b(1:k, 1:k) * V_b(:, 1:k)';
    img_k = cat(3, uint8(img_r_k), uint8(img_g_k), uint8(img_b_k));
end