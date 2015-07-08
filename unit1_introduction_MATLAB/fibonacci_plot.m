%% Define to arrays containing: x = i values from 1 to 25 // y = Fibonacci numbers up to 25

x = [1:25];
y = zeros(1,25);

y(1) = 1;
y(2) = 1;

for i=3:25;
  y(i) = y(i-1) + y(i-2);
end


%% plot the figure:
myfig = figure()
plot(x, y);

xlabel('i')
ylabel('Fibonacci number')

saveas(myfig, './plots/fibonacci.png')


%% to plot it with the log(Fibo)
plot(x, log(y));

xlabel('i')
ylabel('log(Fibonacci number)')

saveas(myfig, './plots/log_fib.png')
