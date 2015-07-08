figure()

t = 0:0.01:4*pi;
plot(t, sin(t));
axis([0 4*pi -1.1 1.1])

hold on

plot(t, cos(t), 'r');

xlabel('t')
ylabel('f(t)')
legend('sin(t)', 'cos(t)')
