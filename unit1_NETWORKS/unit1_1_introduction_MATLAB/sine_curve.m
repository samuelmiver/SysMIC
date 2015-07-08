%% Basic script to plot a sine curve

figure()

t = 0:0.01:4*pi;

plot(t, sin(t))
axis([0 4*pi -1.1 1.1])
xlabel('t')
ylabel('sin(t)')
