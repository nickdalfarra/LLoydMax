function [partitions] = NNcondition(codebook,data)
%NNCONDITION Summary of this function goes here
%   Detailed explanation goes here
    
    p = zeros([length(codebook)-1 1]);
    c = 1;
    
    
    for t = 1:length(data)
    
        if dist(data(t),codebook(c))>dist(data(t),codebook(c+1)) && (c < length(codebook) - 1)
            p(c) = (data(t)+data(t+1))/2;
            c = c + 1; 
        end
        
    end
    
    partitions = p;
end

