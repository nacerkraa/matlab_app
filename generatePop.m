function [newPopulation] = generatePop(numBeaconNodes,ArrayOfErrors, coordinates)
    newPopulation = [];
    for i = 1:10 % To create 40 son from 10 parents (2parents = 4son)
    parents = [];
    for j= 1:2
    IndexofTheError = fortune_wheel(ArrayOfErrors);
    pos = coordinates(IndexofTheError + numBeaconNodes,:);  % to find the real position of the Individual
    parents = vertcat(parents, pos);   % Add the position to the parents array using vertcat
    end
    %disp(['Parents(',num2str(i),') = ']);
    %disp(parents);
    pos1 = parents(1,:);
    pos2 = parents(2,:);
    Sons =crossover(pos1, pos2); % Generate 4 sons from 2 parents with the mutation
    %disp(['Population of parents(',num2str(i),') = ']);
    %disp(newPop);
    newPopulation = [newPopulation;Sons]; % add the sons to the new population
    end
end