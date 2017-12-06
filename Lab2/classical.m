function [Z, counter] = classical( X,Y,n )
%classical matrix multiplication
%   Computes prodcut of two nxn matrices using 8 recursive calls
%   Name: Katherine Juarez
    Z = zeros(n, n);
    counter = 0;
    size = n/2;
    
    % base case when we have a 1x1 matrix
    if n == 1
        % compute product using matlab mult operator
        Z = X*Y;
        % increment the counter by 1
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
        
        % following are the 8 recursive calls 
        [P1, cRecursive] = classical(A,E,size);
        % after the first call, we just want to set the counter to the
        % counter value we get back from the recursive call
        counter = cRecursive;
        [P2, cRecursive] = classical(B,G,size);
        counter = counter + cRecursive;
        % augment the value of our counter with the counter value returned
        % from the recursive call, for each recursive call 2-8
        [P3, cRecursive] = classical(A,F,size);
        counter = counter + cRecursive;
        [P4, cRecursive] = classical(B,H,size);
        counter = counter + cRecursive;
        [P5, cRecursive] = classical(C,E,size);
        counter = counter + cRecursive;
        [P6, cRecursive] = classical(D,G,size);
        counter = counter + cRecursive;
        [P7, cRecursive] = classical(C,F,size);
        counter = counter + cRecursive;
        [P8, cRecursive] = classical(D,H,size);
        counter = counter + cRecursive;
        
        % calculate the product for each one of the four quadrants
        Z11 = P1 + P2;
        Z12 = P3 + P4;
        Z21 = P5 + P6;
        Z22 = P7 + P8;
        
        % concatenate the four quadrants to generate the resulting
        % matrix contaning the final product
        Z = [Z11, Z12; Z21, Z22];
        
        % To calculate the final counter, we know that each matrix does n^2
        % additions for an nxn matrix, so we divide this number by 4
        % because we split our matrix into quadrants. Then we multiply by
        % four because of lines 51-54 where we do a total of four additions
        % to add the matrices together
        counter = counter + 4*((n^2)/4);        
    end
end

