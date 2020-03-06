function [codebook] = Ccondition(partitions, data)
%CCONDITION Summary of this function goes here
%   Detailed explanation goes here

result = zeros([length(partitions)+1 1]);
total = 0;
count = 0;
p = 1;
for t = 1:length(data)
    if data(t) > partitions(p)
        result(p) = total / count;
        p = p + 1;
        count = 0;
        total = data(t);
    else
        count = count + 1;
        total = total + data(t);
    end
end

end

