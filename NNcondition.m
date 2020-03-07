function [partitions] = NNcondition(codebook,data)
%NNCONDITION Get optimal region boundaries for a given codebook
%   Detailed explanation goes here
    
    p = zeros([length(codebook)-1 1]); % array to be populated
    c = 1;
    
    for t = 1:length(data)
        if dist(data(t),codebook(c)) > dist(data(t),codebook(c+1)) ...
                && (c < length(codebook) - 1)
            p(c) = (data(t)+data(t+1))/2;
            c = c + 1; 
        elseif c == length(codebook) - 1
            % home stretch
            while dist(data(t), codebook(c)) < dist(data(t), codebook(c+1))
                t = t+1;
            end
            p(c+1) = (data(t-1) + data(t))/2;
            partitions = p;
        end
        

    end
    
    
end

