function [ArrayOfErrors] = fitness(numBeaconNodes, popSize, coordinates)
% Define variables
count = 0;
ArrayOfErrors = [];
SomeFitness = 0;

% loop into the coordinates matrix to calculate Some of All Individual
for i = (numBeaconNodes+1): (numBeaconNodes + popSize)
   count = count + 1;
    SomeOfErrorsIndividuel = 0;
    for j = 1:numBeaconNodes
        eroorIndividus = calcError(coordinates(i,:), coordinates(j,:)); % calculate the sum of each Individuel
        SomeOfErrorsIndividuel = SomeOfErrorsIndividuel + eroorIndividus; % calculate the sum of all Errors of each Individuel
    end
    fitnessOfIndividus = SomeOfErrorsIndividuel /numBeaconNodes; % calculate the fitness Of each Individuel
    ArrayOfErrors(end+1)= 1/fitnessOfIndividus; % fill the array with the inverted values of fitnessOfIndividus
    
    %disp(['E',num2str(count),' = ', num2str(fitnessOfIndividus)]);
    SomeFitness = SomeFitness + fitnessOfIndividus;
end
    % crezate an array of SomeFitness/fitnessOfIndividus
    ArrayOfErrors = ArrayOfErrors .* SomeFitness;
end