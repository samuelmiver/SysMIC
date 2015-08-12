%%%%%%%%%%%%%%%%%
% INTRODUCTION TO MATHEMATICAL MODELLING
%%%%%%%%%%%%%%%%%

%%%
% ODEs representing (de)phosphorilation of the EpoR
%%%

% unphosphorylated EpoR
dxdt(1)= - k1*x(1)*Epo + k2*x(2);
% phosphorylated EpoR
dxdt(2)=   k1*x(1)*Epo - k2*x(2);


%%%
% Simulating
%%%

% Initial concentration of unphosphorylated EpoR
x(1 )= 0.5;
% Initial concentration of phosphorylated EpoR	
x(2) =  0;


%%%
% Plot the behaviour
%%%

% Settings
options = odeset('InitialStep',0.1,'MaxStep',0.1);
t_range= [0 120];
x_ini= [0.5 0];
% Simulation
[t,x]=ode45(@model_Epo1,t_range,x_ini,options);
% Plot time series of all variables
figure(1);
plot(t,x(:,:));
xlabel('Time ');
ylabel('Epo receptor ');