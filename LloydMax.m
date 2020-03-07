clear;
clc;

epsilon = 0.001;
rates = [1, 2, 3]; % 2^rate codewords
%rates = [1];
T = sort(randn([5000 1]));

for r = rates
    
    % Step 1
    C = sort(randn([2^r 1])); % initial codebook
    P = sort(randn([2^r-1 1])); % initial partitions
    
    m = 1; % iteration counter
    D1 = ExpectedDistortion(P,C,T);
    D2 = D1;
    start = 1; % for sake of entering the for loop

    while start == 1 || ((D1 - D2)/D1 > epsilon)
        start = 0;
        D1 = D2;
        % Step 2
        P = NNcondition(C, T);
        C = Ccondition(P, T);
        
        D2 = ExpectedDistortion(P,C,T);
        
    end
    
    fprintf('Dm - Dmplus1 / Dm = %d \n', (D1-D2)/D1)
    fprintf('Completed training in %d iterations\n',m);
end