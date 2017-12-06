/**
* @author: Katherine Juarez
* @file: RSA.cpp
* @date: 9/14/2017
*/

#include <iostream>
#include <fstream>
#include <string>
#include "RSA.h"
#include "ModularArithmetic.h"

using namespace std;

// RSA constructor generates a private and public key
// private key stored in private variable and public key is shown on screen
RSA :: RSA(int n){
	// Declare the variables
	ModularArithmetic ModArithmetic;
	gmp_randclass r(gmp_randinit_mt);	
	mpz_class p;
	mpz_class q;
	mpz_class N;
	mpz_class s;
	mpz_class e;
	mpz_class d;
	mpz_class gcd;
	int hasInverse;
	pubKey = new mpz_class[2];
	privKey = new mpz_class[2];

	// Generate two large prime numbers
	do{
		p = ModArithmetic.genPrime(n);
		q = ModArithmetic.genPrime(n);
	} while(p == q);
	
	// Compute N
	N = p*q;

	// Compute s
	s = (p-1)*(q-1);

	// Generate a random number for e until it's relatively prime to s
	do{
		e = r.get_z_range(n);

		mpz_gcd(gcd.get_mpz_t(), s.get_mpz_t(), e.get_mpz_t());	
	} while(gcd != 1 || e < 2);
	
	// Make d the inverse of e mod s
	hasInverse = mpz_invert(d.get_mpz_t(), e.get_mpz_t(), s.get_mpz_t());
	if(hasInverse == 0){
		cout<< "Error: Inverse does not exits\n";
		exit(0);
	}

	// Store the private key items
	pubKey[0] = N;
	pubKey[1] = e;

	// Store the pub key items
	privKey[0] = N;
	privKey[1] = d;

	// Output public key to screen
	cout << "Public Key: " << pubKey[0] << " " << pubKey[1] << endl;
}

// RSA constructor generates an n-bit public and private key
// and stores them into their corresponding files
RSA :: RSA(int n, string privKeyFilename, string pubKeyFilename) : RSA(n) {
	// Declare two files to write to	
	ofstream outPrivFile;
	ofstream outPubFile;

	// Write to the private key file
	// Should we gracefully exit if we cannot open the file?
  	outPrivFile.open(privKeyFilename);
	if(outPrivFile){
		outPrivFile << privKey[0] << "\n" << privKey[1] << endl;
	}
	outPrivFile.close();

	// Write to the public key file
	outPubFile.open(pubKeyFilename);
  	outPubFile << pubKey[0] << "\n" << pubKey[1] << endl;
  	outPubFile.close();
}


// RSA constructor reads private and public key from file
// and stores them into corresponding arrays
RSA :: RSA(string privKeyFilename, string pubKeyFilename){
	// Declare files to read from
	ifstream inPrivFile;
	ifstream inPubFile;
	pubKey = new mpz_class[2];
	privKey = new mpz_class[2];
	
	// Handle the private file first
	inPrivFile.open(privKeyFilename);
	// We were unable to open the given file
	if(!inPrivFile){
		cout << "Unable to open private key file" << endl;
		exit(1);
	}
	
	// Loop until we reach the end of the life
	while(!inPrivFile.eof()){
		inPrivFile >> privKey[0] >> privKey[1];	
	}
	// We're done with this one, close private file
	inPrivFile.close();

	// Handle the public file
	inPubFile.open(pubKeyFilename);
	if(!inPubFile){
		cout << "Unable to open public key file" << endl;
		exit(1);
	}

	// Loop until we reach the end of the life
	while(!inPubFile.eof()){
		inPubFile >> pubKey[0] >> pubKey[1];	
	}
	// We're done with this one, close public file
	inPubFile.close();
}

// RSA constructor reads in public key from file and stores in pubKey array
RSA :: RSA(string pubKeyFilename){
	// Declare variables	
	ifstream inPubFile;
	pubKey = new mpz_class[2];

	// Handle the public file
	inPubFile.open(pubKeyFilename);
	if(!inPubFile){
		cout << "Unable to open public key file" << endl;
		exit(1);
	}

	// Loop until we reach the end of the life
	while(!inPubFile.eof()){
		inPubFile >> pubKey[0] >> pubKey[1];	
	}

	// Close the public file
	inPubFile.close();
}

// encrypt generates an encrypted message based on values of pubKey
mpz_class RSA :: encrypt(string message){
	ModularArithmetic ModArithmetic;	
	mpz_class holdMessage;	
	mpz_class c;		
	
	// Store the message in an mpz_class
	holdMessage = message;

	// Returns our message raised to e, mod N
	c = ModArithmetic.modexp(holdMessage, pubKey[1], pubKey[0]);
	
	return c;
}

// decrypt generates a decrypted message based on values of privKey
mpz_class RSA :: decrypt(string data){
	ModularArithmetic ModArithmetic;	
	mpz_class holdData;	
	mpz_class d;
	
	// Store the message in an mpz_class
	holdData = data;

	// Returns our data raised to d, mod N	
	d = ModArithmetic.modexp(holdData, privKey[1], privKey[0]);

	return d;
}