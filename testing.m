% testing uniformCrossover, and onePointCrossover
clc , clearvars

parent1 = [1 2]
parent2 = [5 7]

%positions = onePointCrossover(parent1, parent2);
positions = uniformCrossover(parent1, parent2);
positions

positions = mutation(positions, 0.001, 0.01);
positions
%% testing fitness
anchor_nodes = [5, 10; 18, 26; 15, 30];

% Generate 40 unknown nodes randomly
unknown_nodes = randi([0 50],40,2);
coordinates = [anchor_nodes; unknown_nodes];
num_anchor_nodes = length(anchor_nodes);
array = fitness(num_anchor_nodes, coordinates);
%%
clc, clearvars
A = [2 4 7];
sum_A = sum(A)
B = A.^(-1)
C = B.*sum_A
%%
anchor_nodes = [5, 10; 18, 26; 15, 30];

% Generate 40 unknown nodes randomly
unknown_nodes = randi([0 50],40,2);
coordinates = [anchor_nodes; unknown_nodes];
num_anchor_nodes = length(anchor_nodes);
errors_array = fitness(num_anchor_nodes, coordinates);
parent1_position = calcFitness(num_anchor_nodes,errors_array, coordinates);
parent1_position





