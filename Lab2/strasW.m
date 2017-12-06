function [ Z, counter ] = strasW( X, Y, n )
%strasW matrix multiplication
%   Uses 7 recursive calls, but with 15 add/sub ops
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
        
        E = Y(1:size, 1:size);
        F = Y(1:size, size + 1: n);
        G = Y(size + 1: n, 1:size);
        H = Y(size + 1: n, size + 1: n);
        
        % A11 = A, A12 = B, A21 = C, A22 = D
        S1 = C + D; % one operation
        S2 = S1 - A; % one operation
        S3 = A - C; % one operation
        S4 = B - S2; % one operation
        % total ops here = 4
        
        % B11 = E, B12 = F, B21 = G, B22 = H
        T1 = F - E;
        T2 = H - T1; 
        T3 = H - F; 
        T4 = T2 - G; 
        % total ops here = 4
        
        % following are the 7 recursive calls 
        [P1, cRecursive] = strasW(A, E, size);
        % after the first call, we just want to set the counter to the
        % counter value we get back from the recursive call
        counter = cRecursive;
        [P2, cRecursive] = strasW(B, G, size);
        % augment the value of our counter with the counter value returned
        % from the recursive call, for each recursive call 2-7
        counter = counter + cRecursive;
        [P3, cRecursive] = strasW(S4, H, size);
        counter = counter + cRecursive;
        [P4, cRecursive] = strasW(D, T4, size);
        counter = counter + cRecursive;
        [P5, cRecursive] = strasW(S1, T1,size);
        counter = counter + cRecursive;
        [P6, cRecursive] = strasW(S2, T2, size);
        counter = counter + cRecursive;
        [P7, cRecursive] = strasW(S3, T3, size);
        counter = counter + cRecursive;
        
        % final additions
        U1 = P1 + P6;
        U2 = U1 + P7;
        U3 = U1 + P5;
        % total ops here = 3
        
        C11 = P1 + P2;
        C12 = U3 + P3;
        C21 = U2 - P4;
        C22 = U2 + P5;
        % total ops here = 4
        
        % concatenate the four quadrants to generate the resulting
        % matrix contaning the final product
        Z = [C11, C12; C21, C22];
        
        % for this counter, we have to multiply the amount of
        % additions/subtr by 15 because the total amount of ops done to
        % generate or S, T, U, and C matrices took 15 additions/subs.
        % The (n^2)/4 logic is the same as Classical and Strassen, since we
        % split the matrix into quadrants, and when you add two matrices you
        % are adding n^2 values. 
        counter = counter + 15*((n^2)/4);        
    end
end

