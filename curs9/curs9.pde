int[][] gameBoard = new int[4][4];
int boxSize;
int boxHalf;

void setup() {
  size(500, 500, P2D);

  textSize(height/5);
  textAlign(CENTER, TOP);

  boxSize = width/4;
  boxHalf = boxSize/2;
  
  int randX = int(random(0,4));
  int randY = int(random(0,4));
  
  print("randX, randY", randX, randY);
  gameBoard[randX][randY] = 2;
  
  randX = int(random(0,4));
  randY = int(random(0,4));
  
  print("randX, randY", randX, randY);
  gameBoard[randX][randY] = 2;
  
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

//0 0 2 0
//0 0 0 0
//0 0 0 0
//0 0 0 0
