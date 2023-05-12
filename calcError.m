function error = calcError(point1, point2)
  distance = norm(point1 - point2); %  the norm function is used to calculate the distance between point1 and point2
  error = distance - 0.05 * distance;
end