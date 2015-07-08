%% Basic script to plot a sine curve

figure()
% still resembles a smooth curve on this scale

t = 0:0.2:4*pi; 
plot(t,sin(t),'g')

% the last letter argument defines the color of the curve.

% but with intervals of 0.5 the curve
% no longer appears smooth on this scale
t = 0:0.5:4*pi; 
plot(t,sin(t))

xlabel('t')
ylabel('sin(t)')
