%% Some examples of the use of graphs in MATLAB

%% Generating a simple graph from a matrix

m = zeros(3);

% We can retrieve the size of the matrix in an array of 2 positions as follows:
size(m);

% To fulfill a cell (ex row 1, col 2):
m(1, 2) = 1;
m(2, 3) = 1;
m(3, 1) = 1;

% Ex1
m(3, 2) = 1;

% Ex2
n = zeros(4);
n(1, 2) = 1;
n(2, 3) = 1;
n(2, 4) = 1;


%% Using brackets... easier and quickier
m = [0 1 0; 0 0 1; 1 0 0];


%% Drawing graphs from a matrix
% In the matrix each row or column represents a node and the values in the intersection would represent
% the edges

m = [0 1 0; 0 0 1; 1 1 0];
nodes = {'A' 'B' 'C'};
g = biograph(m, nodes);
view(g)


