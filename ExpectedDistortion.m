function [result] = ExpectedDistortion(partitions, codebook, data)
%EXPECTEDDISTORTION Find expected dist of a quantized data point.
%   Detailed explanation goes here

    total_dist = 0;
    
    for t = 1:length(data)
        
        % get the codebook output
        region = 1;
        if length(partitions) > 1
            while (data(t) < partitions(region+1)) && (region < length(partitions)-1)
                region = region + 1;
            end
        end
        
        if (data(t) > partitions(region))
            region = region + 1;
        end
        
        total_dist = total_dist + dist(data(t), codebook(region));
    end
    
    result = total_dist / length(data);
end

