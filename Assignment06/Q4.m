%part a
figure;
bitcoin_data = readtable('bitcoinHist-1.csv');
daily_prices = table2array(bitcoin_data(:,3));
dates = datetime(bitcoin_data.Date, 'ConvertFrom', 'yyyymmdd');
plot(dates, daily_prices, '-');
title('Bitcoin daily price from 2012-2022');
xlabel('Date');
ylabel('Price');

%part b
chosen_year = 2021;
figure
dates_year = dates(year(dates) == chosen_year);
b_price_year = daily_prices(year(dates) == chosen_year);
plot(dates_year, b_price_year, '-');
title(['Bitcoin daily price - ', num2str(chosen_year)]);
xlabel('Date');
ylabel('Price');

%part c
n = 12;
x = linspace(dates_year(1), dates_year(end), n);
y = interp1(dates_year, b_price_year, x);
x_num = datenum(x);
dates_num = datenum(dates_year);

%part d
pp = spline(x_num, y);
figure
plot(dates_year, b_price_year, '.', dates_year, ppval(pp, dates_num), '-')
legend('Original', 'Spline')
title('Spline Approximation')
xlabel('Date')
ylabel('Price')
