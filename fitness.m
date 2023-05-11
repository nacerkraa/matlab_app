function [arrayOfErrors] = fitness(numBeaconNodes, coordinates)
% Define variables
population = coordinates(numBeaconNodes+1:end, :);
popSize = length(population);
arrayOfErrors = [];

% loop into the coordinates matrix to calculate Some of All Individual
for i = (numBeaconNodes+1): (numBeaconNodes + popSize)
    SomeOfErrorsIndividuel = 0;
    for j = 1:numBeaconNodes
        eroorIndividus = calcError(coordinates(i,:), coordinates(j,:)); % calculate the sum of each Individuel
        SomeOfErrorsIndividuel = SomeOfErrorsIndividuel + eroorIndividus; % calculate the sum of all Errors of each Individuel
    end
    fitnessOfIndividus = SomeOfErrorsIndividuel /numBeaconNodes; % calculate the fitness Of each Individuel
    arrayOfErrors(end+1)= fitnessOfIndividus; % fill the array with the inverted values of fitnessOfIndividus
end
end