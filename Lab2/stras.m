function [ Z, counter ] = stras( X,Y,n )
%stras matrix multiplication
%   Cuts down matrix mult to 7 recursive calls, with 18 add/sub ops
%   Name: Katherine Juarez
    Z = zeros(n, n);
    counter = 0;
    size = n/2;
    
    % base case when we have a 1x1 matrix
    if n == 1
        Z = X*Y;
        counter = counter + 1;
    else
        % first param is row, second param is cols
        % here we split our X matrix into quadrants 
        A = X(1:size, 1:size);
        B = X(1:size, size + 1: n);
        C = X(size + 1: n, 1:size);
        D = X(size + 1: n, size + 1: n);
        
        % here we split our Y matrix into quadrants 
        E = Y(1:size, 1:size);
        F = Y(1:size, size + 1: n);
        G = Y(size + 1: n, 1:size);
        H = Y(size + 1: n, size + 1: n);
        
        % following are the 7 recursive calls 
        [P1, cRecursive] = stras(A, F-H, size); % one operation
        % after the first call, we just want to set the counter to the
        % counter value we get back from the recursive call
        counter = cRecursive;
        [P2, cRecursive] = stras(A+B, H, size); % one operation
        % augment the value of our counter with the counter value returned
        % from the recursive call, for each recursive call 2-7
        counter = counter + cRecursive;
        [P3, cRecursive] = stras(C+D, E, size); % one operation
        counter = counter + cRecursive;
        [P4, cRecursive] = stras(D, G-E, size); % one operation
        counter = counter + cRecursive;
        [P5, cRecursive] = stras(A+D, E+H, size); % two operations
        counter = counter + cRecursive;
        [P6, cRecursive] = stras(B-D, G+H, size); % two operations
        counter = counter + cRecursive;
        [P7, cRecursive] = stras(A-C, E+F, size); %two operations
        counter = counter + cRecursive;
        % total ops here = 10
        
        % calculate the values for each one of the four quadrants in Z
        Z11 = P5 + P4 - P2 + P6; % 3 operations
        Z12 = P1 + P2; % one operation
        Z21 = P3 + P4; %one operation
        Z22 = P1 + P5 - P3 - P7; % 3 operations
        % total ops here = 8
        
        % concatenate the four quadrants to generate the resulting
        % matrix contaning the final product
        Z = [Z11, Z12; Z21, Z22];
        
        % for this counter, we have to multiply the amount of
        % additions/subtr by 18 because the recursive call params and the
        % calculation for each quadrant took 18 ops in total. The (n^2)/4
        % logic is the same here as it was for Classical. 
        counter = counter + 18*((n^2)/4);
        
    end

end

