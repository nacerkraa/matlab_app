function [positions] = crossover(pos1, pos2)

% Create a grid of pos1 and post positions
[X1, X2] = meshgrid(pos1, pos2);


% Reshape the grids into a single column vector
X1 = reshape(X1, [], 1);
X2 = reshape(X2, [], 1);


% Combine the grids to get all the possible position combinations
positions = [X1 X2];

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

end