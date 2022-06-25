import java.util.Map;

int[][] gameBoard = new int[4][4];
int boxSize;
int boxHalf;

HashMap<Integer,Integer> boxColors = new HashMap<Integer,Integer>();



void setup() {
  size(500, 500, P2D);

  textSize(height/5);
  textAlign(CENTER, TOP);

  boxSize = width/4;
  boxHalf = boxSize/2;

  setupColors();

  //gameBoard[2][0]=4;
  //gameBoard[1][0]=2;
  //gameBoard[0][0]=2;

  reset();

}

void reset() {
  for (int j=0; j<4; j++) {
    for (int i=0; i<4; i++) {
      gameBoard[i][j] = 0;
    }
  }
  
  generateNumber();
  generateNumber();
}

void checkBoard() {
  boolean zeroFound = false;
  
  for (int j=0; j<4; j++) {
    for (int i=0; i<4; i++) {
      if(gameBoard[i][j] == 0){
        zeroFound = true;
      }
    }
  }
}

void setupColors() {
  boxColors.put(0, #B4B4B4);
  boxColors.put(2, #FFD900);
  boxColors.put(4, #FFBC00);
  boxColors.put(8, #FFE600);
  boxColors.put(16, #FFA600);
  boxColors.put(32, #FF8D00);
  boxColors.put(64, #FFEA00);
  boxColors.put(128, #FFF300);
  boxColors.put(256, #FFAA00);
  boxColors.put(512, #FFC858);
  boxColors.put(1024, #FFF524);
  boxColors.put(2048, #E1FF24);
}


void draw() {
  background(0);
  for (int j=0; j<4; j++) {
    for (int i=0; i<4; i++) {
      fill(boxColors.get(gameBoard[j][i]));
      
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
  
  while(gameBoard[randY][randX] != 0) {
    randY = int(random(0,4));
    randX = int(random(0,4));
  }
  
  println("randY, randX", randY, randX);
  
  gameBoard[randY][randX] = 2;
}


void keyPressed() {
  //if(keyPressedByUser) return;
  char myKey = key;
  if (myKey >= 'a' && key <= 'z') {
    myKey = (char)(myKey + 'A' - 'a');
  }
  
  int i_copy; 
  int j_copy;
  boolean added;
  boolean something_moved = false;

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
               something_moved = true;
             }
          }
        }
      }
      break;
    case 'A':
      for(int i = 0; i < 4; i++) {
        for(int j = 1; j < 4; j++) {
          j_copy = j;
          added = false;
          if(gameBoard[i][j_copy] != 0) {
             while(j_copy != 0 && ((gameBoard[i][j_copy-1] == gameBoard[i][j_copy] && !added) || gameBoard[i][j_copy-1] == 0)) {
               if(gameBoard[i][j_copy-1] == gameBoard[i][j_copy]) {
                 gameBoard[i][j_copy-1] += gameBoard[i][j_copy];
                 added = true;
               } else {
                 gameBoard[i][j_copy-1] = gameBoard[i][j_copy];
               }
               gameBoard[i][j_copy] = 0;
               j_copy -= 1;
               something_moved = true;
             }
          }
        }
      }
      break;
    case 'S':
      for(int i = 2; i >= 0; i--) {
        for(int j = 0; j < 4; j++) {
          i_copy = i;
          added = false;
          if(gameBoard[i_copy][j] != 0) {
             while(i_copy != 3 && ((gameBoard[i_copy+1][j] == gameBoard[i_copy][j] && !added) || gameBoard[i_copy+1][j] == 0)) {
               if(gameBoard[i_copy+1][j] == gameBoard[i_copy][j]) {
                 gameBoard[i_copy+1][j] += gameBoard[i_copy][j];
                 added = true;
               } else {
                 gameBoard[i_copy+1][j] = gameBoard[i_copy][j];
               }
               gameBoard[i_copy][j] = 0;
               i_copy += 1;
               something_moved = true;
             }
          }
        }
      }
      break;
    case 'D':
      for(int i = 0; i < 4; i++) {
        for(int j = 2; j >= 0; j--) {
          j_copy = j;
          added = false;
          if(gameBoard[i][j_copy] != 0) {
             while(j_copy != 3 && ((gameBoard[i][j_copy+1] == gameBoard[i][j_copy] && !added) || gameBoard[i][j_copy+1] == 0)) {
               if(gameBoard[i][j_copy+1] == gameBoard[i][j_copy]) {
                 gameBoard[i][j_copy+1] += gameBoard[i][j_copy];
                 added = true;
               } else {
                 gameBoard[i][j_copy+1] = gameBoard[i][j_copy];
               }
               gameBoard[i][j_copy] = 0;
               j_copy += 1;
               something_moved = true;
             }
          }
        }
      }
      break;
  }
  
  if(something_moved) {
    generateNumber();
  }
  //keyPressedByUser = true;
}

//0 0 0 2
//0 0 0 0
//0 0 0 0
//0 0 0 0
