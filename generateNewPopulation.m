function [newPopGenerated] = generateNewPopulation(parent1_position, parent2_position);
    newPopGenerated = [];
    for i = 1:20 % To create 40 son from 20 parents (2parents = 2son)
        sons = uniformCrossover(parent1_position, parent2_position); % Generate 4 sons from 2 parents with the mutation
        mutation_rate = 0.001;
        mutation_scale = 0.001;
        sons = gaussian_mutation(sons, mutation_rate, mutation_scale);
        newPopGenerated = [newPopGenerated; sons]; % add the sons to the new population
    end
end