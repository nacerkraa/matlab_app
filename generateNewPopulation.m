% 
function [newPopGenerated] = generateNewPopulation(numBeaconNodes,ArrayOfErrors, coordinates)
    newPopGenerated = [];
    for i = 1:20 % To create 40 son from 20 parents (2parents = 2son)


    parent1_index = roulette_wheel(ArrayOfErrors);
    parent1_position = coordinates(parent1_index + numBeaconNodes,:);
    parent2_index = roulette_wheel(ArrayOfErrors);
    parent2_position = coordinates(parent2_index + numBeaconNodes,:);
    
    Sons = uniformCrossover(parent1_position, parent2_position); % Generate 4 sons from 2 parents with the mutation
    mutation_rate = 0.001;
    mutation_scale = 0.001;
    Sons = gaussian_mutation(Sons, mutation_rate, mutation_scale);
    newPopGenerated = [newPopGenerated; Sons]; % add the sons to the new population
    end
end