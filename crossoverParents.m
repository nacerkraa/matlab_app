function [positions] = crossoverParents(pos1, pos2)
    clc, clearvars
    pos1 = [5 3];
    pos2 = [6 8];
    
    pos3 = [pos1(1) pos2(2)];
    pos4 = [pos2(1) pos1(2)];
    
    positions = [pos3; pos4];
    
    % Define the mutation probability threshold
    mutation_prob = 0.01;
    
    % Loop over each position and decide whether to mutate it
    for i = 1:size(positions, 1)
        if rand() < mutation_prob
            % Generate a new random value for the mutated position
            new_value = randi([0 50], 1);

            % Generate random position x or y
            rand_pos = randi([1, 2], 1);
            % Replace the original value with the new one
            positions(i, rand_pos) = new_value;
            %disp('mutation happend.....');
    end
end