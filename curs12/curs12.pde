int[][] board = new int[4][4];

int boxSize;
int boxHalf;

void setup() {
  size(500, 500, P2D);

  textSize( height / 5 );
  textAlign(CENTER, TOP);

  boxSize = width / 4;
  boxHalf = boxSize / 2;
  
  generateNumber();
  generateNumber();
}


void draw() {
  background(0);

  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < 4; i++) {
      fill(#B4AE97);
      square(i*boxSize, j*boxSize, boxSize);

      fill(#79766A);
      text(board[j][i], boxHalf + i*boxSize, j*boxSize);
    }
  }
}


void generateNumber() {
  int randX = int(random(0,4));
  int randY = int(random(0,4));
  
  while(board[randX][randY] != 0) {
    randX = int(random(0,4));
    randY = int(random(0,4));
  }
  
  println("randX, randY", randX, randY);
  
  board[randX][randY] = 2;
}


void keyPressed() {
  //if(isKeyPressed) return;
  //w - sus, a - stanga, s - jos, d - dreapta
  char myKey = key;
  if (myKey >= 'a' && myKey <= 'z') {
    myKey = (char) (myKey + 'A' - 'a');
  }
  
  int i_copy;

  switch(myKey) {
  case 'W':
    for(int i = 1; i < 4; i++) {
       for(int j = 0; j < 4; j++) {
         i_copy = i;
         if(board[i_copy][j] != 0) {
           while(i_copy != 0 && board[i_copy-1][j] == 0) {
             board[i_copy-1][j] = board[i_copy][j];
             board[i_copy][j] = 0;
             i_copy -= 1;
           }
           
           if(i_copy != 0 && board[i_copy-1][j] == board[i_copy][j]) {
             board[i_copy-1][j] += board[i_copy][j];
             board[i_copy][j] = 0;
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
  //isKeyPressed = true;
}



//0 0 2 0
//0 0 0 0
//0 0 0 0
//0 0 0 0

//0 0 0 0
