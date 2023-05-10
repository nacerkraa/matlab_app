% testing uniformCrossover, and onePointCrossover
clc , clearvars

parent1 = [1 2]
parent2 = [5 7]

%positions = onePointCrossover(parent1, parent2);
positions = uniformCrossover(parent1, parent2);
positions

positions = mutation(positions, 0.001, 0.01);
positions