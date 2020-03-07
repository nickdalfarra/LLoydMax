function [codebook] = Ccondition(partitions, data)
%CCONDITION Get the average value of data points between each partition
%   Detailed explanation goes here

result = zeros([length(partitions)+1 1]);
total = 0;
count = 0;
p = 1;

for t = 1:length(data)
    if p > length(partitions)
        result(p) = mean(data(t:length(data)));
        codebook = result;
    elseif data(t) > partitions(p)
        result(p) = total / count; % MSE assumption
        p = p + 1;
        count = 1;
        total = data(t);
    else
        count = count + 1;
        total = total + data(t);
    end
    
end

end

