% One-point crossover
function [positions] = onePointCrossover(pos1, pos2)
    crossover_point = randi([1, size(pos1, 2)]);
    offspring1 = [pos1(:,1:crossover_point) pos2(:,crossover_point+1:end)];
    offspring2 = [pos2(:,1:crossover_point) pos1(:,crossover_point+1:end)];
    positions = [offspring1; offspring2];
end