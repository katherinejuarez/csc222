#include <iostream>
#include <time.h>
#include <stdlib.h>
#include <gmpxx.h>
#include "ModularArithmetic.h"

using namespace std;

// modadd adds up two mpz_classes and subtracts N to make sure sum is not too large
// returns modified sum 
mpz_class ModularArithmetic :: modadd(mpz_class& a, mpz_class& b, mpz_class& N){
	mpz_class sum;

	sum = a + b;
	
	// if the sum is too large...
	if (sum > N){
		// reduce it by subtracting N
		sum = sum - N;
	}	

	return sum;
}

// modmult takes two mpz_classes and multiplies them
// returns mod of the resulting product
mpz_class ModularArithmetic :: modmult(mpz_class& a, mpz_class& b, mpz_class& N){
	mpz_class product;

	product = (a * b) % N;

	return product;
}

// moddiv takes two mpz_classes and multiplies the first class by the inverse of the second class
// returns mod of the resulting product
mpz_class ModularArithmetic :: moddiv(mpz_class& a, mpz_class& b, mpz_class& N){
	mpz_class c;
	int hasInverse;
	
	// returns num > 1if the inverse exists
	hasInverse = mpz_invert(c.get_mpz_t(), b.get_mpz_t(), N.get_mpz_t());
	
	if(hasInverse == 0){
		cout<< "Error: Inverse does not exits\n";
		exit(0);
	}

	c = (a * c) % N;

	return c;
}

// modexp takes the first mpz_class and raises it to the second mpz_class
// taking into account if the returned exp is even/odd
// returns resutl mod N
mpz_class ModularArithmetic :: modexp(mpz_class& a, mpz_class& b, mpz_class& N){
	mpz_class z;
	mpz_class half;
	
	if(b == 0) {
		return 1;
	}

	// int arithmetic to floor b
	half = b / 2;

	// recursive call, passing in newly floored b
	z = modexp(a, half, N);

	// check if b is even
	if(b % 2 == 0){
		return (z * z) % N;
	} else {
		return (a * z * z) % N;
	}
}

// isPrime determines if a given mpz_class is prime
// correctedness 1/2^k 
// returns true if prime, false if not prime
bool ModularArithmetic :: isPrime(mpz_class& N, int k){
	gmp_randclass r(gmp_randinit_mt);
	mpz_class currExp = N - 1;	
	mpz_class c;

	// test primality k times
	for(int i = 0; i < k; i++){
		// generate the random number
		c = r.get_z_range(N);
		if(modexp(c, currExp, N) != 1){
			return false;
		}
	}

	return true;	
}

// genPrime creates a random n-bit prime and makes sure it fits the calculated bounds
// tried to use gmp_randclass::get_z_bits, but kept getting floating point error
// returns the generated prime num
mpz_class ModularArithmetic :: genPrime(int n){
	mpz_class lowerLim;
	mpz_class upperLim;
	mpz_class base = 2;
	mpz_class randomNum;
	int k = 64;
	int lowerNum = n -1;
	int upperNum = n;

	// lowerLim 2^n - 1
	mpz_pow_ui(lowerLim.get_mpz_t(), base.get_mpz_t(), lowerNum); 

	// upperLim 2^n 
	mpz_pow_ui(upperLim.get_mpz_t(), base.get_mpz_t(), upperNum);

	srand(time(NULL));

	// loop until we find the right sized prime number
	while(true){
		randomNum = rand() % ((upperLim + 1) - lowerLim) + lowerLim;
		if(isPrime(randomNum, k)){
			return randomNum;
		}
	}
}