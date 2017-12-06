/**
* @author: Katherine Juarez
* @file: knapsack.cpp
* @date: 11/1/2017
*/

#include <iostream>
#include <fstream>
#include <stdlib.h>
#include <string>

using namespace std;

/**
 * knapsack() uses dynamic programming to find the optimal combination between weight and  
 * various valued items to determine what a robber should put into his/her knapsack
 * this solution maintains a 2D array and backtracks to print out the actual items that 
 * make up the optimal solution.
 * @param string fileName is the file containing weight and value information
 * @return the optimal solution involving knapsack with capacity W
 */
void knapsack(string fileName){
	// Declare variables we'll need to store from file
	int W;
	int n;
	int w = 0;
	int i = 0;
	int count = 0;
	string temp;

	// Declare file to read from
	ifstream inFile;

	// Open the file containing weight/value info
	inFile.open(fileName.c_str());

	// We were unable to open the given file
	if(!inFile){
		cout << "Unable to open file" << endl;
		exit(1);
	}

	// Obtain the capacity and number of items and store them in local variables
	inFile >> temp >> W >> temp >> n;

	// Declare needed variables now that we have n and W
	int values[n];
	int weights[n];
	int included[n];
	int knapNum = n;
	int knapWeight = W;
	int **K = new int *[n+1];
	
	// Dynamically allocate memory for our 2D array
	for(i = 0; i <= n; i++){
		K[i] = new int[W+1];
	} 

	i = 0;
	// Loop inFile until we reach the end of the life
	while(!inFile.eof()){
		// Store the weights and values for items in corresponding arrays
		inFile >> temp >> weights[i] >> temp >> values[i];
		i++;	
	}

	// Close the file after we are done getting info from it
	inFile.close();

	cout << "hello" <<endl;
	// Fill the 2D array K with corresponding values
	for(i = 0; i <= n; i++){ // rows are items
		for(w = 0; w <= W; w++){ // cols are weights
			if(i == 0 || w == 0){
				// enter the case where we either have 0 item or 0 weight
				K[i][w] = 0;
			}
			// case where we can actually fit this weight within the capacity
			else if(weights[i-1] <= w){
				// Take the max of either including or excluding this item
				K[i][w] = max(K[i-1][w-weights[i-1]] + values[i-1], K[i-1][w]);
			}
			// the item weight was too large, we can do without it
			else {
				K[i][w] = K[i-1][w];
			}
		}
	}

	// knapNum starts at n, we decrement it within the loop and want to ensure we're pos.
	while( knapNum > 0){
		// check if I'm equal to the item right above me, if so then not included
		if(K[knapNum][knapWeight] == K[knapNum-1][knapWeight]){
			included[knapNum] = 0;
			knapNum = knapNum - 1;
		} else {
			// This index is actually included, we want to update the array	
			included[knapNum] = 1;
			// Decrement our curr. num to reflect adding this item
			knapNum = knapNum - 1;
			// Decrement our curr. weight to reflect addingt this item
			knapWeight = knapWeight - weights[knapNum];
			
			// Increment count to signify the number of items included
			count++;
		}		
	}

	// Store this information into a file
	ofstream outFile;

	// Generic file name
	string outFileName = "output-a.txt";

	// Open up the file
	outFile.open(outFileName.c_str());
	
	// If we were succesfully able to open up the file
	if(outFile){
		// Output total weight info and total index info
		outFile << "V " << K[n][W] << endl;
		outFile << "i " << count << endl;
		
		// Output the actual indices that make up the optimal solution
		for(i = 0; i < n; i++){
			if(included[i] == 1){
				outFile << i << endl;
			}
		}
	}

	// We're done, close the file
	outFile.close();

	// Free dynamically allocated memory
	for(i = n; i >= 0; i--){
		delete K[i];
	}

	delete K;


	// Return the optimal solution to our problem
	return;
}

/**
 * main() calls knapsack algorithm and passes it a file name.
 *
 */
int main(){
	// Declare variables
	int result;
	int option;
	string fileName;
	
	// Ask for user input
	cout << "Which file would you like to use?" << endl;
	cout << " 0 - small.txt      1 - medium.txt      2 - large.txt" << endl;
	cin >> option;

	// Set name based on user input
	switch(option){
		case 0: fileName = "small.txt";
			break;
		case 1: fileName = "medium.txt";
			break;
		case 2: fileName = "large.txt";
			break;
		default: 
			cout << "Please type a legit number" << endl;
			exit(0);
	}

	// Store the optimal solution returned by our algorithm
	knapsack(fileName);

	//cout << "The optimal solution was " << result << endl;
	cout << "You can view in-depth results in output-a.txt" << endl;

}
