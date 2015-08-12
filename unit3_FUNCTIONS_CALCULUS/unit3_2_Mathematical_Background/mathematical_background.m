%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FUNCTIONS AND CALCULUS : MATHEMATICAL BACKGROUND:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%
% Exercise 2.2.1
%%%

syms t
w = @(t) 10^5 * exp(0.04*t);

dw = simplify(w(t+1) -w(t));

simplify(dw/w(t))

%%%
% Exercise 2.2.2
% Calculating derivatives
%%%

syms x t c d

diff(1 - 0.9*exp(-0.5*x))
subs(diff(3*x^4-4*x+1),x,2)
diff(log(t),2)
subs(diff(log(c*x+d),x),x,0)

%%%
% Exercise 2.2.3
% Finding stationary points of y(x)=5−2(x+1)e^(−x/2) when (x≥0).
%%%

syms x
y = 5-2*(x+1)*exp(-1/2*x)
dy = simplify(diff(y))
pt = solve(dy == 0)
ddy = simplify(diff(dy))
subs(ddy,x,pt)
subs(y,x,pt)

%%%
% Exercise 2.2.4
% Ploting functions
%%%

y = @(x) (x - 2)/(x^2 - 3)
fplot(y,[-5,5,-4,4])

%%%
% Exercise 2.2.5
% Sketch the graph of the function
%%%

f = @(v) v/(4+1.5*v+0.008*v^2);
fplot(f, [0,500,-1,1])
%or to find value of maxima using symbolic equation
syms v
f=v/(4+1.5*v+0.008*v^2)
df=diff(f)
solve(df==0)
% gives solution 10*5^(1/2)=sqrt(500)
subs(f,v,500^.5)

%%%
% Exercise 2.2.6
% Solving integrals
%%%

syms x v y t
int(exp(5*x))
int(1/(36+4*v^2),v)
int(1/(3-2*y),y)
int(1/sqrt(9-t^2),t,-3,3)
int((5*t^3+7)/t,t)
int(2*log(4*t)-2/t,t)

%%%
% Exercise 2.2.8
%%%
syms v k a b
assume(k>0); % otherwise MATLAB returns the wrong answer
sol = simplify(int(1/(v^2-k^2),v))
assume(a>0);
assume(b>0);
simplify(int(1/(a-b*v^2),v)); % does not work directly
simplify(subs(sol/-b,k,sqrt(a/b)))