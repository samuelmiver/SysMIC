function dxdt=model_Epo1(t,x)
% Initialize model vector with zeroes,
dxdt=zeros(2,1);
% Parameters
k1= 0.005;  %     Rate of EpoR phosphorylation
k2= 0.005;  %     Rate of EpoR dephosphorylation
Epo = 50;   %     Epo concentration

%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Differential Equation:  
%
% unphosphorylated EpoR
dxdt(1)= - k1*x(1)*Epo + k2*x(2);
% phosphorylated EpoR
dxdt(2)=   k1*x(1)*Epo - k2*x(2);
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%