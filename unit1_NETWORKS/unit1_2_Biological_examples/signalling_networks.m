% Practice to learn how to analyze a Protein-Protein
% Interaction network

% First, we read the file
tdfread('2001699_Tables_S1_S2_S6.txt'); 

% Some editing requirements
Input_node_GeneID =  Input0x2Dnode_GeneID;
Output_node_GeneID =  Output0x2Dnode_GeneID;
Input_node_Gene_Symbol =  Input0x2Dnode_Gene_Symbol;
Output_node_Gene_Symbol =  Output0x2Dnode_Gene_Symbol;

% Extract the number of unique proteins
Input_node_Gene_Symbol = cellstr(Input_node_Gene_Symbol);
Output_node_Gene_Symbol = cellstr(Output_node_Gene_Symbol);
all_nodes = [Input_node_Gene_Symbol; Output_node_Gene_Symbol];
nodes = unique(all_nodes);

% To define the unique proteins (NODES):
length(nodes)

% And interactions (EDGES)
length(Input_node_Gene_Symbol) 

%%% STATISTICS AND DRAWS %%%

% Plotting a direction score
hist(Edge_direction_score);
xlabel('Confidence score');
ylabel('Number of edges');
% Selecting the highly scoring edges 
% Extract quality edges
indices = find(Edge_direction_score >= 0.99);
subInput_node_Gene_Symbol = Input_node_Gene_Symbol(indices);
subOutput_node_Gene_Symbol = Output_node_Gene_Symbol(indices);

% Create a mapping between the gene symbol and an integer value to select
% only the unique protein nodes
sub_nodes = [subInput_node_Gene_Symbol; subOutput_node_Gene_Symbol];
nodes = unique(sub_nodes);
nnodes = length(nodes);
ids = 1:1:nnodes;
symbol2myid = containers.Map(nodes,ids);

% With this we have assigned a integer for each protein; to view it just
% type the protein identifier
symbol2myid('SMAD1') 

% Extract the integer values for the quality edges and create sparse matrix
edge_inputs = cell2mat( symbol2myid.values(subInput_node_Gene_Symbol) ); 
edge_outputs = cell2mat( symbol2myid.values(subOutput_node_Gene_Symbol) ); 
A = sparse( edge_inputs, edge_outputs, 1, nnodes, nnodes);

% Draw it 
% Draw graph
bg = biograph(A, nodes);
bg.LayoutType='radial';
bg.LayoutScale = 3/4;
dolayout(bg)
bgview = view(bg);
% The resulting graph appears in the figure folder

%%% We can easily extract a representation of the degree distribution
%%% (results in figure in_ out_)

in_degree = sum(A);
out_degree = sum(A,2);
figure()
hist(in_degree)
xlabel('in degree');
ylabel('Number of nodes');
figure();
hist(out_degree)
xlabel('out degree');
ylabel('Number of nodes');

% We can plot them in the same barchar 
v = 0:max(out_degree);
c1 = hist(out_degree, v);
c2 = hist(in_degree, v);
m = [c2 ; c1];
bar(v,m',1.0); 
legend('in degree', 'out degree');
% Better visulaization if we rescale the vertical axis
set(gca,'YScale','log')


%%% Analyze the degree sequence
in_degree_sequence = sort(in_degree);
out_degree_sequence = sort(out_degree);

% degree sequence scatter plot
scatter(in_degree_sequence,out_degree_sequence);
xlabel('in degree');
ylabel('out_degree');
hold on
line( [0,15], [0,15] )

%%% Study the connected compounds
% Find connected components and extract the largest
[S,C] = graphconncomp(A,'Weak', true);

% List the elements of the array
bins = 1:48
x=hist(C,bins)
indices=find(C==1);

% manipulate the adjacency matrix to extract only those rows and columns 
% corresponding to the largest connected component
temp = A(:,indices);
new_A = temp(indices,:);
new_nodes = nodes(indices);
new_ids = 1:length(new_nodes);
new_symbol2myid = containers.Map(new_nodes,new_ids);

% redraw
bg2 = biograph(new_A, new_nodes);
bg2.LayoutType='radial';
bg2.LayoutScale = 3/4;
dolayout(bg2)
bgview = view(bg2);