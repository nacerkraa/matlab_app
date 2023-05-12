% uniform crossover
function [positions] = uniformCrossover(pos1, pos2)
    mask = rand(size(pos1)) < 0.5;
    offspring1 = pos1.*mask + pos2.*(1-mask);
    offspring2 = pos2.*mask + pos1.*(1-mask);
    positions = [offspring1; offspring2];
    
    mutation_rate = 0.001;
    mutation_scale = 0.001;
    positions = gaussian_mutation(positions, mutation_rate, mutation_scale);
end
