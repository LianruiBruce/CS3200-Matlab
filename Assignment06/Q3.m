syms f(x)
f(x) = exp(x);
np = 1001;
xn = linspace(0, 2, np);
y = double(f(xn));
figure
plot(xn, y, 'LineWidth', 2);
title('Exponential Function');
xlabel('x');
ylabel('f(x)');
hold on

errors = zeros(4, 2, 8, 2);
times = zeros(4, 8, 2);

degrees = [6, 11, 21, 41, 81, 161, 321, 641];
i = 1;

for n = degrees
    for spacing = 1:2
        if spacing == 1
            x_cheb = linspace(0, 2, n);
        else
            k = 1:n;
            x_cheb = 1 - cos(pi * (k - 1) / (n - 1));
        end
        y_cheb = double(f(x_cheb));

        %polyinterp
        tic
        poly = polyinterp(x_cheb, y_cheb, xn);
        times(1, i, spacing) = toc;

        %barylag
        tic
        data = [x_cheb', y_cheb'];
        bary = barylag(data, xn');
        times(2, i, spacing) = toc;

        %vandermonde
        tic
        A = fliplr(vander(x_cheb));
        a = A \ y_cheb';
        vander_y = polyval(a, xn);
        times(3, i, spacing) = toc;

        %spline
        tic
        spline_y = spline(x_cheb, y_cheb, xn);
        times(4, i, spacing) = toc;

        e_poly = y - poly;
        Linf_poly = norm(e_poly, "inf");
        L2_poly = norm((e_poly.^2), 2);
        errors(1, :, i, spacing) = [Linf_poly, L2_poly];

        e_bary = y - bary';
        Linf_bary = norm(e_bary, "inf");
        L2_bary = norm((e_bary.^2), 2);
        errors(2, :, i, spacing) = [Linf_bary, L2_bary];

        e_vander = y - vander_y;
        Linf_vander = norm(e_vander, "inf");
        L2_vander = norm((e_vander.^2), 2);
        errors(3, :, i, spacing) = [Linf_vander, L2_vander];

        e_spline = y - spline_y;
        Linf_spline = norm(e_spline, "inf");
        L2_spline = norm((e_spline.^2), 2);
        errors(4, :, i, spacing) = [Linf_spline, L2_spline];
    end
    i = i + 1;
end
% Plot results
for spacing = 1:2
    figure
    for j = 1:4
        subplot(2, 2, j)
        plot(degrees, times(j, :, spacing))
        hold on
        title(['Method ', num2str(j), ' Time'])
        xlabel('Number of Points')
        ylabel('Time (s)')
    end
    sgtitle(['Timing Results (', num2str(spacing), ')'])

    figure
    for j = 1:4
        subplot(2, 2, j)
        plot(degrees, squeeze(errors(j, 1, :, spacing)))
        hold on
        title(['Method ', num2str(j), ' Infinity Norm'])
        xlabel('Number of Points')
        ylabel('Error')
    end
    sgtitle(['Error Results (', num2str(spacing), ')'])
end

