ratio = (1+sqrt(5))/2;
n = [100 500 800 1100];
for i = 1 : 4
    current = 1:n(i);
    r = (current - 1).^(ratio);
    theta = 2 * (current - 1) * pi * ratio;
    subplot(2,2,i);
    polarplot(theta,r,".m" );
end