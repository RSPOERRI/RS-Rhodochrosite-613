import math

typeof = lambda x : str(type(x))[8:-2]

#returns square root, cube root, any root
def root(numbr, expo=3):
	add = 0
	output = 0.0
	while add < 15:
		#go a little over:
		while output ** expo <= numbr:
			output += 10 ** -add
		#then go back one step:
		output -= 10 ** -add
		add += 1
	return output
	
def isPrime (numbr):
	factor = 2
	while factor <= math.sqrt(numbr):
		if numbr % factor == 0:
			return False
		factor += 1
	return True

def findPrimes (quota):
	output = [2]
	chkPrime = 3
	while len(output) < quota:
		if isPrime(chkPrime):
			output.append(chkPrime)
		chkPrime += 1
	return output
def rev (Xput):
	if typeof(Xput) == "str":
		return Xput[::-1]
	else:
		return str(Xput)[::-1]
