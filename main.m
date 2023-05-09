% Part-1
% main algorithm
clc, clearvars, close all

% Define variables
numUnknownNodes = 40;
distBeaconNodes = 10;
popSize = 50;
beaconNodes = [5, 10; 18, 26; 15, 30; 20, 35; 25, 25; 30, 40; 35, 14; 40, 20; 42, 10; 50, 5];
numBeaconNodes = length(beaconNodes);
coordinates = NaN(numUnknownNodes + numBeaconNodes,2);
coordinates(1:numBeaconNodes, :) = beaconNodes;
for i = (numBeaconNodes+1):(numBeaconNodes+popSize)
    rowCoord = randi([1, 50]);
    colCoord = randi([1, 50]);
    coordinates(i, :) = [rowCoord, colCoord];
end

figure(1)
% Create the graph
scatter(coordinates(1:numBeaconNodes, 1), coordinates(1:numBeaconNodes, 2),100, 'r','square');
hold on;
scatter(coordinates(numBeaconNodes+1:end, 1), coordinates(numBeaconNodes+1:end, 2), 'b');
title('Coordonnees des noeuds'); % set the title for the graph
xlabel('Ligne');
ylabel('Colonne');
legend('Noeuds balises', 'Noeuds inconnus');


MyBeacon = [];
UnkownPosition = [];

for i = (numBeaconNodes+1): (numBeaconNodes + numUnknownNodes)
    count = 0;
    TablBeacon = [];
    for j = 1:numBeaconNodes
        distance = calcDistance(coordinates(i,:), coordinates(j,:));

        if distance < distBeaconNodes 
            count = count+1;
            
            TablBeacon(end+1,:) = [coordinates(j,1),coordinates(j,2)]; % intialis? deux valeur a TablBeacon.coordinates(j,1),coordinates(j,2
        end
        
        if length(TablBeacon) >= 3
            UnkownPosition = coordinates(i,:);
            MyBeacon = TablBeacon;
        end
    end
end

% Choose random postion to estimate it location

estimateLocation(MyBeacon, UnkownPosition);