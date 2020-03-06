clear;
clc;

epsilon = 0.001;
rates = [1, 2, 3]; % 2^rate codewords
T_raw = randn([5000 1]); % training set
T = sort(T_raw);

for r = rates
    
    % Step 1
    C1 = sort(randn([2^r 1])); % initial codebook
    P1 = sort(randn([2^r-1 1])); % initial partitions
    
    m = 1; % iteration counter
    D1 = ExpectedDistortion(P1,C1,T);
    D2 = D1/2; % for sake of entering the for loop

    while((D1 - D2)/D1 > epsilon)
        
        % Step 2
        P1 = NNcondition(C1, T);
        C1 = Ccondition(P1, T);
        
    end
    
    fprintf('Completed training in %d iterations\n',m);
end