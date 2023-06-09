function [unokown_node, close_nodes] = get_close_nodes(anchor_nodes, unknown_nodes, threshold)
    coordinates = [anchor_nodes; unknown_nodes];
    numBeaconNodes = length(anchor_nodes);
    numUnknownNodes = length(unknown_nodes);
   count = 0;
   for i = (numBeaconNodes+1) : (numBeaconNodes + numUnknownNodes)
      TablBeacon = [];
      for j = 1:numBeaconNodes
         distance = norm(coordinates(i,:) - coordinates(j,:)); 
         if distance < threshold   
             TablBeacon(end+1,:) = [coordinates(j,1),coordinates(j,2)];
         end
      end
      if length(TablBeacon) >= 3 & length(coordinates(i,:)) > 0
               count = count+1;
               unokown_node = coordinates(i,:);
               disp(['Unknown node: ', num2str(count),' location: (', num2str(unokown_node(1)),'), (',num2str(unokown_node(2)),')']);
               close_nodes = TablBeacon 
      end
   end
end