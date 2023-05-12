function [bestPositions] = estimateLocation(beaconNodes, UnkownPosition)
disp(['Generate population for the uknown node: (', num2str(UnkownPosition(1)),'), (',num2str(UnkownPosition(2)),')',]);
% Define variabels
% Generate 40 unknown nodes randomly
popSize = 70; % The number of the population
unknown_nodes = randi([0 50],popSize,2);
numBeaconNodes = length(beaconNodes); % The number of the beacon nodes

coordinates = [beaconNodes; unknown_nodes];

figure(2)
makeGraph(beaconNodes,UnkownPosition,coordinates); % draw the graph of the population and the beacons nodes

    for i = 1:5
        population = coordinates(numBeaconNodes+1:end, :);
        arrayOfErrors = fitness(numBeaconNodes, coordinates);
        parent1_position = get_parent(numBeaconNodes, arrayOfErrors, coordinates); 
        parent2_position = get_parent(numBeaconNodes, arrayOfErrors, coordinates);
        newPopGenerated = generateNewPopulation(parent1_position, parent2_position); % to create a new generation from two parents selected by fortune_wheel
        newPopulation = [population; newPopGenerated]; % newnewPopulation now contain 80 population
        coordinates = [beaconNodes; population; newPopGenerated];

        arrayOfErrors = fitness(numBeaconNodes, coordinates); % calculate the fitness again for the 80 population
        arrayOfErrors = arrayOfErrors.'; % To make ArrayOfErrors horizontal to add it for adding it to the population array after
        mainTable = [newPopulation arrayOfErrors]; % mainTable it's a matrix contain tables and their errors
        bestPositions = selectBestGeneration(mainTable); % select the best 40 from 80 population based of their error
        coordinates = [beaconNodes ;bestPositions]; % The best generation becomes the new population
    end
end
