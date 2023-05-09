function [bestPositions] = findPosition(beaconNodes,reelPos)
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
makeGraph(beaconNodes,reelPos,coordinates); % draw the graph of the population and the beacons nodes

for i = 1:10
    bestPositions = assumeLocation(beaconNodes, coordinates);
    coordinates = [beaconNodes ;bestPositions];
end
bestPositions
end
