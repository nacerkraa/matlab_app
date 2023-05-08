% Part-3
% Sorting an array
function [bestGeneration] = selectBestGeneration(ArrayOfPositions)
    % Sort the rows based on the values in the last column
    bestGeneration = sortrows(ArrayOfPositions, size(ArrayOfPositions, 2));
    
    % Select the first two rows of A without the last column
    bestGeneration = bestGeneration(1:40, 1:end-1);
end

