int[][] board = new int[4][4];
int score;

int boxSize;
int boxHalf;

HashMap<Integer,Integer> blockColors = new HashMap<Integer,Integer>();

void setupColors() {
  blockColors.put(0,#B7B7B7);
  blockColors.put(2,#05F2C5);
  blockColors.put(4,#05F299);
  blockColors.put(8,#63FC9F);
  blockColors.put(16,#B4FC63);
  blockColors.put(32,#02DED8);
  blockColors.put(64,#24B7C6);
  blockColors.put(128,#00FF0E);
  blockColors.put(256,#A5FFC8);
  blockColors.put(512,#A5FFF8);
  blockColors.put(1024,#EEFFA5);
  blockColors.put(2048,#FFA5A8);
}

void setup() {
  size(500, 500, P2D);
  surface.setTitle("2048-2022");
  
  textSize( height / 7 );
  textAlign(CENTER, TOP);

  boxSize = width / 4;
  boxHalf = boxSize / 2;
  
  setupColors();
 
  reset();
}

void reset() {
  score = 0;
  
  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < 4; i++) {
      board[i][j] = 0;
    }
  }
  
  generateNumber();
  generateNumber();
}

void checkBoardAndReset() {
  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < 4; i++) {
      if(board[i][j] == 0) return;
      
      if(i>0 && i<3) {
        if(board[i-1][j] == board[i][j] || board[i+1][j] == board[i][j]) return;
      }
      if(j>0 && j<3) {
        if(board[i][j-1] == board[i][j] || board[i][j+1] == board[i][j]) return;
      }
    }
  }
  
  reset();
}

void draw() {
  background(0);

  textSize( height / 7 );
  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < 4; i++) {
      fill(blockColors.get(board[j][i]));
      square(i*boxSize, j*boxSize, boxSize);

      fill(#79766A);
      text(board[j][i], boxHalf + i*boxSize, j*boxSize);
    }
  }
  
  textSize(30);
  text(score, boxHalf, height - 35);
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
  
  boolean something_moved = false;
  int i_copy;
  int j_copy;

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
             something_moved = true;
           }
           
           if(i_copy != 0 && board[i_copy-1][j] == board[i_copy][j]) {
             board[i_copy-1][j] += board[i_copy][j];
             score += board[i_copy-1][j];
             board[i_copy-1][j] *= -1;
             board[i_copy][j] = 0;
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
         if(board[i][j_copy] != 0) {
           while(j_copy != 0 && board[i][j_copy-1] == 0) {
             board[i][j_copy-1] = board[i][j_copy];
             board[i][j_copy] = 0;
             j_copy -= 1;
             something_moved = true;
           }
           
           if(j_copy != 0 && board[i][j_copy] == board[i][j_copy-1]) {
             board[i][j_copy-1] += board[i][j_copy];
             score += board[i][j_copy-1];
             board[i][j_copy-1] *= -1;
             board[i][j_copy] = 0;
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
         if(board[i_copy][j] != 0) {
           while(i_copy != 3 && board[i_copy+1][j] == 0) {
             board[i_copy+1][j] = board[i_copy][j];
             board[i_copy][j] = 0;
             i_copy += 1;
             something_moved = true;
           }
           
           if(i_copy != 3 && board[i_copy+1][j] == board[i_copy][j]) {
             board[i_copy+1][j] += board[i_copy][j];
             score += board[i_copy+1][j];
             board[i_copy+1][j] *= -1;
             board[i_copy][j] = 0;
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
         if(board[i][j_copy] != 0) {
           while(j_copy != 3 && board[i][j_copy+1] == 0) {
             board[i][j_copy+1] = board[i][j_copy];
             board[i][j_copy] = 0;
             j_copy += 1;
             something_moved = true;
           }
           
           if(j_copy != 3 && board[i][j_copy] == board[i][j_copy+1]) {
             board[i][j_copy+1] += board[i][j_copy];
             score += board[i][j_copy+1]; 
             board[i][j_copy+1] *= -1;
             board[i][j_copy] = 0;
             something_moved = true;
           }
           
         }
       }
    }
    break;
  }
  
  if(something_moved) {
    generateNumber();
    checkBoardAndReset();
  }
  
  for (int j = 0; j < 4; j++) {
    for (int i = 0; i < 4; i++) {
      if(board[i][j] < 0) {
        board[i][j] *= -1;
      }
    }
  }
}



//0 0 2 0
//0 0 0 0
//0 0 0 0
//0 0 0 0

//0 0 0 0
