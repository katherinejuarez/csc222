function [ ] = unitTest()
%unitTest Checks for correctness of the three algorithms for lab2a
%   multiplies an nxn matrix with mathlab * op and compares that value to
%   the value returned from the three functions
%   Name: Katherine Juarez
    
    % Generate the 2x2 matrices
    A = randi(2, 2);
    B = randi(2, 2);

    % Calculate the correct output
    correctOutput = A*B;
    
    % Test the 2x2 Output for Classical
    [classicalOutputTwo, counter1]  = classical(A,B,2);
    if classicalOutputTwo == correctOutput
        'Classical test for 2x2 matrix PASSED'
        disp(counter1);
    else
        'Classical test for 2x2 matrix FAILED'
    end
    
    % Test the 2x2 Output for Strassen
    [strasOutputTwo, counter2] = stras(A,B,2);
    if strasOutputTwo == correctOutput
        'Strassen test for 2x2 matrix PASSED'
        disp(counter2);
    else
        'Strassen test for 2x2 matrix FAILED'
    end
    
    % Test the 2x2 Output for Strassen-Winograd
    [strasWOutputTwo, counter3] = strasW(A,B,2);
    if strasWOutputTwo == correctOutput
        'Strassen-Wino test for 2x2 matrix PASSED'
        disp(counter3);
    else 
        'Strassen-Wino test for 2x2 matrix FAILED'
    end
    
    %----------------------------------------------------------------------
    % Generate the 4x4 matrices
    A = randi(4, 4);
    B = randi(4, 4);

    % Calculate the correct output
    correctOutput = A*B;
    
    % Test the 4x4 Output for Classical
    [classicalOutputFour, counter1]  = classical(A,B,4);
    if classicalOutputFour == correctOutput
        'Classical test for 4x4 matrix PASSED'
        disp(counter1);
    else
        'Classical test for 4x4 matrix FAILED'
    end
    
    % Test the 4x4 Output for Strassen
    [strasOutputFour, counter2] = stras(A,B,4);
    if strasOutputFour == correctOutput
        'Strassen test for 4x4 matrix PASSED'
        disp(counter2);
    else
        'Strassen test for 4x4 matrix FAILED'
    end
    
    % Test the 4x4 Output for Strassen-Winograd
    [strasWOutputFour, counter3] = strasW(A,B,4);
    if strasWOutputFour == correctOutput
        'Strassen-Wino test for 4x4 matrix PASSED'
        disp(counter3);
    else 
        'Strassen-Wino test for 4x4 matrix FAILED'
    end
   
    %----------------------------------------------------------------------
    % Generate the 8x8 matrices
    A = randi(8, 8);
    B = randi(8, 8);

    % Calculate the correct output
    correctOutput = A*B;
    
    % Test the 8x8 Output for Classical
    [classicalOutputEight, counter1]  = classical(A,B,8);
    if classicalOutputEight == correctOutput
        'Classical test for 8x8 matrix PASSED'
        disp(counter1);
    else
        'Classical test for 8x8 matrix FAILED'
    end
    
    % Test the 8x8 Output for Strassen
    [strasOutputEight, counter2] = stras(A,B,8);
    if strasOutputEight == correctOutput
        'Strassen test for 8x8 matrix PASSED'
        disp(counter2);
    else
        'Strassen test for 8x8 matrix FAILED'
    end
    
    % Test the 8x8 Output for Strassen-Winograd
    [strasWOutputEight, counter3] = strasW(A,B,8);
    if strasWOutputEight == correctOutput
        'Strassen-Wino test for 8x8 matrix PASSED'
        disp(counter3);
    else 
        'Strassen-Wino test for 8x8 matrix FAILED'
    end
   
%----------------------------------------------------------------------
    % Generate the 16x16 matrices
    A = randi(16, 16);
    B = randi(16, 16);

    % Calculate the correct output
    correctOutput = A*B;
    
    % Test the 16x16 Output for Classical
    [classicalOutputSixteen, counter1]  = classical(A,B,16);
    if classicalOutputSixteen == correctOutput
        'Classical test for 16x16 matrix PASSED'
        disp(counter1);
    else
        'Classical test for 16x16 matrix FAILED'
    end
    
    % Test the 16x16 Output for Strassen
    [strasOutputSixteen, counter2] = stras(A,B,16);
    if strasOutputSixteen == correctOutput
        'Strassen test for 16x16 matrix PASSED'
        disp(counter2);
    else
        'Strassen test for 16x16 matrix FAILED'
    end
    
    % Test the 16x16 Output for Strassen-Winograd
    [strasWOutputSixteen, counter3] = strasW(A,B,16);
    if strasWOutputSixteen == correctOutput
        'Strassen-Wino test for 16x16 matrix PASSED'
        disp(counter3);
    else 
        'Strassen-Wino test for 16x16 matrix FAILED'
    end
    
    %----------------------------------------------------------------------
    % Generate the 32x32 matrices
    A = randi(32, 32);
    B = randi(32, 32);

    % Calculate the correct output
    correctOutput = A*B;
    
    % Test the 32x32 Output for Classical
    [classicalOutputThirtyTwo, counter1]  = classical(A,B,32);
    if classicalOutputThirtyTwo == correctOutput
        'Classical test for 16x16 matrix PASSED'
        disp(counter1);
    else
        'Classical test for 16x16 matrix FAILED'
    end
    
    % Test the 32x32 Output for Strassen
    [strasOutputThirtyTwo, counter2] = stras(A,B,32);
    if strasOutputThirtyTwo == correctOutput
        'Strassen test for 32x32 matrix PASSED'
        disp(counter2);
    else
        'Strassen test for 32x32 matrix FAILED'
    end
    
    % Test the 32x32 Output for Strassen-Winograd
    [strasWOutputThirtyTwo, counter3] = strasW(A,B,32);
    if strasWOutputThirtyTwo == correctOutput
        'Strassen-Wino test for 32x32 matrix PASSED'
        disp(counter3);
    else 
        'Strassen-Wino test for 32x32 matrix FAILED'
    end
    
    %----------------------------------------------------------------------
    % Generate the 64x64 matrices
    A = randi(64, 64);
    B = randi(64, 64);

    % Calculate the correct output
    correctOutput = A*B;
    
    % Test the 64x64 Output for Classical
    [classicalOutputSixtyFour, counter1]  = classical(A,B,64);
    if classicalOutputSixtyFour == correctOutput
        'Classical test for 64x64 matrix PASSED'
        disp(counter1);
    else
        'Classical test for 64x64 matrix FAILED'
    end
    
    % Test the 64x64 Output for Strassen
    [strasOutputSixtyFour, counter2] = stras(A,B,64);
    if strasOutputSixtyFour == correctOutput
        'Strassen test for 64x64 matrix PASSED'
        disp(counter2);
    else
        'Strassen test for 64x64 matrix FAILED'
    end
    
    % Test the 64x64 Output for Strassen-Winograd
    [strasWOutputSixtyFour, counter3] = strasW(A,B,64);
    if strasWOutputSixtyFour == correctOutput
        'Strassen-Wino test for 64x64 matrix PASSED'
        disp(counter3);
    else 
        'Strassen-Wino test for 64x64 matrix FAILED'
    end
    
    %----------------------------------------------------------------------
    % Generate the 128x128 matrices
    A = randi(128, 128);
    B = randi(128, 128);

    % Calculate the correct output
    correctOutput = A*B;
    
    % Test the 128x128 Output for Classical
    [classicalOutputOneTwentyEight, counter1]  = classical(A,B,128);
    if classicalOutputOneTwentyEight == correctOutput
        'Classical test for 128x128 matrix PASSED'
        disp(counter1);
    else
        'Classical test for 128x128 matrix FAILED'
    end
    
    % Test the 128x128 Output for Strassen
    [strasOutputOneTwentyEight, counter2] = stras(A,B,128);
    if strasOutputOneTwentyEight == correctOutput
        'Strassen test for 128x128 matrix PASSED'
        disp(counter2);
    else
        'Strassen test for 128x128 matrix FAILED'
    end
    
    % Test the 128x128 Output for Strassen-Winograd
    [strasWOutputOneTwentyEight, counter3] = strasW(A,B,128);
    if strasWOutputOneTwentyEight == correctOutput
        'Strassen-Wino test for 128x128 matrix PASSED'
        disp(counter3);
    else 
        'Strassen-Wino test for 128x128 matrix FAILED'
    end
    
    %----------------------------------------------------------------------
    % Generate the 256x256 matrices
    A = randi(256, 256);
    B = randi(256, 256);

    % Calculate the correct output
    correctOutput = A*B;
    
    % Test the 256x256 Output for Classical
    [classicalOutputTwoFiftySix, counter1]  = classical(A,B,256);
    if classicalOutputTwoFiftySix == correctOutput
        'Classical test for 256x256 matrix PASSED'
        disp(counter1);
    else
        'Classical test for 256x256 matrix FAILED'
    end
    
    % Test the 256x256 Output for Strassen
    [strasOutputTwoFiftySix, counter2] = stras(A,B,256);
    if strasOutputTwoFiftySix == correctOutput
        'Strassen test for 256x256 matrix PASSED'
        disp(counter2);
    else
        'Strassen test for 256x256 matrix FAILED'
    end
    
    % Test the 256x256 Output for Strassen-Winograd
    [strasWOutputTwoFiftySix, counter3] = strasW(A,B,256);
    if strasWOutputTwoFiftySix == correctOutput
        'Strassen-Wino test for 256x256 matrix PASSED'
        disp(counter3);
    else 
        'Strassen-Wino test for 256x256 matrix FAILED'
    end
    
    %----------------------------------------------------------------------
    % Generate the 512x512 matrices
    A = randi(512, 512);
    B = randi(512, 512);

    % Calculate the correct output
    correctOutput = A*B;
    
    % Test the 512x512 Output for Classical
    [classicalOutputFiveTwelve, counter1]  = classical(A,B,512);
    if classicalOutputFiveTwelve == correctOutput
        'Classical test for 512x512 matrix PASSED'
        disp(counter1);
    else
        'Classical test for 512x512 matrix FAILED'
    end
    
    % Test the 512x512 Output for Strassen
    [strasOutputFiveTwelve, counter2] = stras(A,B,512);
    if strasOutputFiveTwelve == correctOutput
        'Strassen test for 512x512 matrix PASSED'
        disp(counter2);
    else
        'Strassen test for 512x512 matrix FAILED'
    end
    
    % Test the 512x512 Output for Strassen-Winograd
    [strasWOutputFiveTwelve, counter3] = strasW(A,B,512);
    if strasWOutputFiveTwelve == correctOutput
        'Strassen-Wino test for 512x512 matrix PASSED'
        disp(counter3);
    else 
        'Strassen-Wino test for 512x512 matrix FAILED'
    end
end