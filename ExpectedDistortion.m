function [result] = ExpectedDistortion(partitions, codebook, dataset)
%EXPECTEDDISTORTION Summary of this function goes here
%   Detailed explanation goes here

    total_dist = 0;
    
    for t = 1:length(dataset)
        
        region = 1;
        while (t < partitions(region)) && (region < length(partitions))
            region = region + 1;
        end
        
        total_dist = total_dist + dist(t, codebook(region));
    end
    
    result = total_dist / length(dataset);
end

