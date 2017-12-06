/**
* @author: Katherine Juarez
* @file: knapsack-opt.cpp
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
 * this version of the program optimizes so that we only keep track of the previous and 
 * current row so that we can optimize memory usage to order W instead of order nW.
 * @param string fileName is the file containing weight and value information
 * @return the optimal solution involving knapsack with capacity W
 */
int knapsack(string fileName){
	// Declare variables we'll need to store from file
	int W;
	int n;
	int w = 0;
	int i = 0;
	string temp;

	// Declare file to read from
	ifstream inFile;

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
	int previous[W + 1];
	int current[W + 1];

	// Loop inFile until we reach the end of the life
	while(!inFile.eof()){
		inFile >> temp >> weights[i] >> temp >> values[i];
		i++;	
	}

	// Close the file after we are done getting info from it
	inFile.close();

	// Initialize the previous and current array values to 0s
	for(i = 0; i <= W; i++){
		previous[i] = 0;
		current[i] = 0;
	}

	// Fill current array with corresponding values
	for(i = 1; i <= n; i++){ // rows are item values
		for(w = 0; w <= W; w++){ // cols are weights
			if(i == 0 || w == 0){
				// enter the case where we either have 0 item or 0 weight
				current[w] = 0;
			}
			// case where we can actually fit this weight within the capacity
			else if(weights[i-1] <= w){
				current[w] = max(previous[w-weights[i-1]] + values[i-1], previous[w]);
			}
			// the item weight was too large, we can do without it
			else {
				current[w] = previous[w];
			}
		} // end col, i

			// copy current into previous
			for(int j = 0; j <= W; j++){
				previous[j] = current[j];
			}
	}
	
	// Return the somewhat optimal solution to our problem
	return current[W];
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
	result = knapsack(fileName);

	cout << "The optimal solution was " << result << endl;

}
