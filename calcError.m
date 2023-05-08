function [error] = calcError(point1, point2)
    error = (sqrt((point1(1)-point2(1))^2 + (point1(2)-point2(2))^2)) + (sqrt((point1(1)-point2(1))^2 + (point1(2)-point2(2))^2)) * 5 / 100;
end