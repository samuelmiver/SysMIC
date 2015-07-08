%% Define to arrays containing: x = i values from 1 to 25 // y = Fibonacci numbers up to 25

x = [1:20];
y = zeros(1,20);

y(1) = 1;
y(2) = 1;

for i=3:20;
  y(i) = y(i-1) + y(i-2);
end

%% Generate a new array with the ratios of the Fibonacci numbers

new_y = zeros(1,19);

for i=1:19;
  new_y(i) = y(i+1)/y(i);
end

%% plot the figure:
myfig = figure()
plot(new_y);

hold on

gr = 1.61803398875;
plot([0,20], [gr,gr], 'r')

xlabel('i')
ylabel('Fibonacci Ratio (fib(i+1)/fib(i))')

saveas(myfig, './plots/fib_ratio_golden.png')
