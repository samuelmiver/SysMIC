%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTIONS AND CALCULUS : BIOLOGICAL EXAMPLES:
% BACTERIAL GROWTH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%
% CELL ELONGATION
%%%%

% Ex 1.1.1 Size of E. coli after 12 min assuming it is a cylinder

% Knowing the volume would be V = pi*r²*l and assuming the starting size is
% 0.4 um³ and ends at 0.8um³ and this occurs with an interval of 20 min,
% the change in volume per minute will be:

fun  = @(t) 0.4 + 0.02*t;

% Then, for 12':
fun(12)

% We can plot it using:

limits = [0 20];
fplot(fun,limits)
xlabel('time (minutes)')
ylabel('volume')

% We can use the function rom a separeted file:
elongation(7)

% Ex 1.1.3: A strain of E.coli takes 15 minutes to grow from 0.3 to 0.6
% um³. Create a function in MATLAB to model this and plot the growth cycle:
fun = @(t) 0.3 + 0.02*t;
limits = [0 20]
fplot(fun, limits)
xlabel('time (minutes)')
ylabel('volume')

%%%%
% UNLIMITED POPULATION GROWTH
%%%%

% Exercise 1.1.4: A colony of 20 E-coli doubles its population every 20 
% minutes. How many bacteria will there be after 120 minutes?  

t = 0:20:120; 
nt = length(t); 
N = zeros(1,nt); 
N(1) = 100;
for j=2:nt,
    N(j) = 2*N(j-1); 
end


% And plot it 
plot(t,N,'o') 
xlabel('time (minutes)','fontsize',12) 
ylabel('N_j','fontsize',12)


% Using symbolic calculation to obtain R (increment per minute of the
% population)

syms N0 R
assume(R,'real')
assume(R>0)
R = solve( 2*N0 == N0*(1+R)^20, R) 

eval(R)

% This give us the value of 0.0353. That means we need 1 minute to
% increase the population about 3.5%

% we also can have an idea of the exponential growth:
t2 = 0:1:120;
nt2 = length(t2);
N2 = zeros(1,nt2);
N2(1) = 100;
for j=2:nt2,
     N2(j) = 1.0353*N2(j-1);
end

% And plot it minute by minute
plot(t2,N2,'o')
hold on 
fun2 = @(t) 100*exp(log(1.0353)*t); 
limits = [0 120];
fplot(fun2,limits,'r')

plot(t2,N2,'o')
hold on 
fun2 = @(t) 100*exp(log(1.0353)*t); 
limits = [0 120];
fplot(fun2,limits,'r')


plot(t2,N2,'o')
hold on 
fun2 = @(t) 100*exp(log(1.0353)*t); 
limits = [0 120];
fplot(fun2,limits,'r')


%%%%
% THE DYING POPULATION
%%%%

% Basic function representing the dying decay in population
fun = @(t) 1000000*exp(-9.627e-4*t);

% Plot it
limits = [0 7200];
fplot(fun,limits)
xlabel('time (minutes)')
ylabel('N')

% Ex 1.1.8 An E-coli colony has a population which falls by 50% every 4 
% hours.Calculate the decay constant for the population.

k = (log(2))/(4*60)

% Define a function to model the population if its initial value is
% 1,000,000 bacteria. Use fun to calculate the population after 24 hours.
fun = @(t) 1000000*exp(-2.89e-3*t);

fun(1440)


%%%%
% GROWTH IN LIMITED RESOURCES
%%%%

% Plot the steady state
fun = @(t,r0,N0,K) K*N0*exp(r0*t)/(K-N0+N0*exp(r0*t)); 
fun1 = @(t) fun(t,0.0347,100,1000)
fun2 = @(t) fun(t,0.0347,1500,1000) 
limits = [0 240];
fplot(fun1,limits,'b')
hold on
fplot(fun2,limits,'r')
xlabel('time','fontsize',12)
ylabel('N','fontsize',12)
legend('N_0=100','N_0=1500','Location','SouthEast')


