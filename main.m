% Part-1
% main algorithm
clc, clearvars, close all

% Set anchor nodes
anchor_nodes = [5, 10; 18, 26; 15, 30; 20, 35; 25, 25; 30, 40; 35, 14; 40, 20; 42, 10; 50, 5];

% Generate 40 unknown nodes randomly
unknown_nodes = randi([0 50],40,2);

numBeaconNodes = length(anchor_nodes);

coordinates = [anchor_nodes; unknown_nodes];

% Plot the anchor nodes and the unknown nodes
figure(1)
scatter(coordinates(1:numBeaconNodes, 1), coordinates(1:numBeaconNodes, 2),100, 'r','square');
hold on;
scatter(coordinates(numBeaconNodes+1:end, 1), coordinates(numBeaconNodes+1:end, 2), 'b');
title('Coordonnees des noeuds'); % set the title for the graph
xlabel('Ligne');
ylabel('Colonne');
legend('Noeuds balises', 'Noeuds inconnus');

threshold = 30;
[unokown_node, close_nodes] = get_close_nodes(anchor_nodes, unknown_nodes, threshold);

%Choose random postion to estimate it location
bestPosition = estimateLocation(close_nodes, unokown_node);
firstValue = bestPosition(1,:)
scatter(firstValue(1),firstValue(2),50, 'r','x'); % Set the real position just for testing porposes
