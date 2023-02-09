syms t;
v(t) = piecewise((0 <= t) <= 10, 11 * t.^(2) - 5 * t, (10 <= t) <= 20, 1100 - 5 * t,(20 <= t) <= 30, 50 * t+ 2*(t -20).^(2),t>30, 1520 * exp(-0.2*(t-30)),0 );
subplot(2,1,1);
plot(1:50, v(1:50));
value = (50);
for i = 2 : 50
    value(i) = trapz(1:i, v(1:i));
end
subplot(2,1,2);
plot(1:50, value);
