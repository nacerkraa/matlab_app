% 
function [newPopGenerated] = generateNewPopulation(numBeaconNodes,ArrayOfErrors, coordinates)
    newPopGenerated = [];
    for i = 1:20 % To create 40 son from 20 parents (2parents = 2son)
    parents = [];
        for j= 1:2
            IndexofTheError = fortune_wheel(ArrayOfErrors);
            pos = coordinates(IndexofTheError + numBeaconNodes,:);  % to find the position of the Individual on the coordinates
            parents = vertcat(parents, pos);   % Add the position to the parents array using vertcat
        end
    pos1 = parents(1,:);
    pos2 = parents(2,:);
    Sons = crossoverParents(pos1, pos2); % Generate 4 sons from 2 parents with the mutation
    newPopGenerated = [newPopGenerated;Sons]; % add the sons to the new population
    end
end