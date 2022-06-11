int[][] gameBoard = new int[4][4];
int boxSize;
int boxHalf;

void setup() {
  size(500,500, P2D);
  
  textSize(height/5);
  textAlign(CENTER, TOP);
  
  boxSize = width/4;
  boxHalf = boxSize/2;
  
}


void draw() {
  background(0);
  
  for(int i=0; i<4; i++) {
    fill(#FFC503);
    rect(0, 0, boxSize, boxSize); 
    
    fill(#AA9D73);
    text(gameBoard[0][0], boxHalf,0);
  }
}
