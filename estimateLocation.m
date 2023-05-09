function [bestPositions] = estimateLocation(beaconNodes, UnkownPosition)
% Define variabels
popSize = 40; % The number of the population
numBeaconNodes = length(beaconNodes); % The number of the beacon nodes
coordinates = NaN(popSize + numBeaconNodes,2);  % an empty matrix of 43 x 2s
coordinates(1:numBeaconNodes, :) = beaconNodes;
    % fill the rest with random values represnt the our population
    for i = (numBeaconNodes+1):(numBeaconNodes+popSize)
        rowCoord = randi([1, 50]);
        colCoord = randi([1, 50]);
        coordinates(i, :) = [rowCoord, colCoord];
    end

    figure(2)
    makeGraph(beaconNodes,UnkownPosition,coordinates); % draw the graph of the population and the beacons nodes

for i = 1:10
    population = coordinates(numBeaconNodes+1:end, :);
    popSize = length(population);
    [ArrayOfErrors] = fitness(numBeaconNodes, popSize, coordinates); % Calculate the error of each Individuel and the sum of all these errors
    newPopGenerated = generateNewPopulation(numBeaconNodes, ArrayOfErrors, coordinates); % to create a new generation from two parents selected by fortune_wheel
    newPopulation = [population; newPopGenerated]; % newnewPopulation now contain 80 population
    length(beaconNodes)
    length(population)
    length(newPopGenerated)
    coordinates = [beaconNodes; population; newPopGenerated];
    length(coordinates)
    popSize = popSize*2;
    [ArrayOfErrors] = fitness(numBeaconNodes, popSize, coordinates); 
    ArrayOfErrors = ArrayOfErrors.'; % to make ArrayOfErrors horizontal to add it for adding it to the population array after
    mainTable = [newPopulation ArrayOfErrors]; % mainTable it's a matrix contain tables and their errors
    bestPositions = selectBestGeneration(mainTable); % select the best 40 from 80 population based of their error
    coordinates = [beaconNodes ;bestPositions]; % The best generation becomes the new population
end
    bestPositions
end
