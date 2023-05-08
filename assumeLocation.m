% Part-2
function [bestPositions] = assumeLocation(beaconNodes, coordinates)
    
numBeaconNodes = length(beaconNodes); % The number of the beacon nodes
population = coordinates(numBeaconNodes+1:end, :);
popSize = length(population);


[ArrayOfErrors, SomeFitness] = fitness(numBeaconNodes, popSize, coordinates); % Calculate the error of each Individuel and the sum of all these errors
newPopulation = generatePop(numBeaconNodes, ArrayOfErrors, coordinates); % to crezate new generation from two parents selected by fortune_wheel
newPopulation = [population; newPopulation];
coordinates = [beaconNodes;population; newPopulation];
popSize = popSize*2;
[ArrayOfErrors, SomeFitness] = fitness(numBeaconNodes, popSize, coordinates); 
ArrayOfErrors = ArrayOfErrors.'; % to make ArrayOfErrors horizontal to add it for adding it to the population array after
mainTable = [newPopulation ArrayOfErrors]; % mainTable it's a matrix contain tables and their errors
bestPositions = selectBestGeneration(mainTable); % select the best 40 from 80 population based of their error
bestPositions
end
