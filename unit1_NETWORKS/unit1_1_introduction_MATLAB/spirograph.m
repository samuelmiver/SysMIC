%% Basic script to plot a simple spirograph behaviour

myfig = figure()
points = 0:0.01*pi:12*pi;

plot( 0, 0, 'w');
%% This would generate an empty plot

axis([-20 20 -20 20]);

hold on

for i = 1:length(points);
  t = points(i);
  x = 11*cos(t) - 6*cos(11*t/6);
  y = 11*sin(t) - 6*sin(11*t/6);
  plot(x, y, 'rp');
  pause(0.01);
end

%% The function pause waits 0.01 after each point is drawn

saveas(myfig, './plot/spirograph.png')
