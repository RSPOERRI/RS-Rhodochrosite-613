function rand4 (){
  	var x = Math.random() * 10;
  	if (x > 5) {
      	if (x > 2.5) {
          	return 2;
        }
      	else {
          	return 1;
        }
    }
  	else {
      	if (x > 7.5) {
          	return 4;
        }
      	else {
          	return 3;
        }
    }
}
function makeThree (a, b, c, x) {
  	var [x1, x2, x3] = a;
    var [x4, x5, x6] = b;
  	var [x7, x8, x9] = c;
  	/**TTT Priorities
     *		Avoid Trap
     * 		Try to win
     * 		Prevent user from winning
     * 		Otherwise:
     * 			Go in the middle
     *			Go in the side
     * 			Otherwise:
     *				Random
     *
     * 
     */
  	//Row
  	if (x1 == x3 == x && !x2) {
      	return 2;
    }
  	else if (x4 == x6 == x && !x5) {
      	return 5;
    }
  	else if (x7 == x9 == x && !x8) {
      	return 8;
	}
  	//Column
  	else if (x1 == x7 == x && !x4) {
      	return 4;
	}
  	else if (x2 == x8 == x && !x5) {
      	return 5;
	}
  	else if (x3 == x9 == x && !x6){
      	return 6;
    }
  	//Diagonal
  	else if (x1 == x9 == x) {
      	if (!x5) {
          	return 5;
        }
      	else {
          	return rand4() * 2;
        }
    }
  	else if (x3 == x7 == x) {
      	if (!x5) {
          	return 5;
        }
      	else {
          	return rand4() * 2;
        }
    }
  	else {
      	return 0;
    }
}
