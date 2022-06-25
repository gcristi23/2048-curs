int[][] gameBoard = new int[4][4];
int boxSize;
int boxHalf;

void setup() {
  size(500, 500, P2D);

  textSize(height/5);
  textAlign(CENTER, TOP);

  boxSize = width/4;
  boxHalf = boxSize/2;
  gameBoard[0][0]=4;
  gameBoard[1][0]=2;
  gameBoard[2][0]=2;

  generateNumber();
  generateNumber();

}


void draw() {
  background(0);
  for (int j=0; j<4; j++) {
    for (int i=0; i<4; i++) {
      if(gameBoard[j][i] == 0) fill(#A5A5A5);
      else fill(#FFC503);
      
      rect(i*boxSize, j*boxSize, boxSize, boxSize);
      
      if(gameBoard[j][i] == 0) fill(#E3E2E0);
      else fill(#AA9D73);
      text(gameBoard[j][i], boxHalf + i*boxSize, j*boxSize);
    }
  }
}

void generateNumber() {
  int randY = int(random(0,4));
  int randX = int(random(0,4));
  
  println("randY, randX", randY, randX);
  
  while(gameBoard[randY][randX] != 0) {
    randY = int(random(0,4));
    randX = int(random(0,4));
  }
  
  gameBoard[randY][randX] = 2;
}


void keyPressed() {
  //if(keyPressedByUser) return;
  char myKey = key;
  if (myKey >= 'a' && key <= 'z') {
    myKey = (char)(myKey + 'A' - 'a');
  }
  
  int i_copy; 
  boolean added;

  switch(myKey) {
    case 'W':
      for(int i = 1; i < 4; i++) {
        for(int j = 0; j < 4; j++) {
          i_copy = i;
          added = false;
          if(gameBoard[i_copy][j] != 0) {
             while(i_copy != 0 && ((gameBoard[i_copy-1][j] == gameBoard[i_copy][j] && !added) || gameBoard[i_copy-1][j] == 0)) {
               if(gameBoard[i_copy-1][j] == gameBoard[i_copy][j]) {
                 gameBoard[i_copy-1][j] += gameBoard[i_copy][j];
                 added = true;
               } else {
                 gameBoard[i_copy-1][j] = gameBoard[i_copy][j];
               }
               gameBoard[i_copy][j] = 0;
               i_copy -= 1;
             }
          }
        }
      }
      break;
    case 'A':

      break;
    case 'S':

      break;
    case 'D':

      break;
  }
  //keyPressedByUser = true;
}

//0 0 0 2
//0 0 0 0
//0 0 0 0
//0 0 0 0
