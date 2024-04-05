import processing.net.*;
sqr[] board=new sqr[64];
Cursor mano;//=new cursor
PImage[] tab=new PImage[12];
int sqrSize=40;
int turn=1;//par->negro ; impar->blanco

void setup() {
  size(320, 320);
  initBoard();
  setBoard();
  mano=new Cursor(0, 0, 40);
}

void draw() {
  stroke(0);
  drawBoard(40);
  mano.move(board);
  mano.signal();
  for (int i=0; i<8; i++) {
    if (board[i].piece==5)board[i].piece=3;
    if (board[i+7*8].piece==6)board[i+7*8].piece=4;
  }
}

boolean validMove(int px, int py, int x, int y) {
  boolean ret=false;
  int piece=mano.prevPiece;
  if (turn%2==piece%2 ) {
    switch(piece) {
    case 1://torre blanca
      ret=torreBlanca(px, py, x, y);
      break;
    case 2://torre negra
      ret=torreNegra(px, py, x, y);
      break;
    case 3://reina blanca
      ret=reinaBlanca(px, py, x, y);
      break;
    case 4://reina negra
      ret=reinaNegra(px, py, x, y);
      break;
    case 5://peon blanco
      ret=peonBlanco(px, py, x, y);
      break;
    case 6://peon negro
      ret=peonNegro(px, py, x, y);
      break;
    case 7://rey blanco
      ret=reyBlanco(px, py, x, y);
      break;
    case 8://rey negro
      ret=reyNegro(px, py, x, y);
      break;
    case 9://alfil blanco
      ret=alfilBlanco(px, py, x, y);
      break;
    case 10://alfil negro
      ret=alfilNegro(px, py, x, y);
      break;
    case 11://caballo blanco
      ret=caballoBlanco(px, py, x, y);
      break;
    case 12://caballo negro
      ret=caballoNegro(px, py, x, y);
      break;
    }
  }
  return ret;
}
