void drawBoard(int sqrSize) {
  noStroke();
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      fill(135, 201, 90 );
      if (((i+j)%2==0 && !multiplayer) || ((i+j)%2==0 && rotateOff)) {
        fill(255);
      }
      if ((i+j)%2!=team && multiplayer && !rotateOff) {//flip board around
        fill(255);
      }
      rect(i*sqrSize, j*sqrSize, sqrSize, sqrSize);
    }
  }
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      if (board[i+j*8].piece>0) {
        if (!multiplayer || (multiplayer && team==1) || rotateOff) {
          image(tab[board[i+j*8].piece-1], i*sqrSize, j*sqrSize, sqrSize, sqrSize);
        }
        if (multiplayer && team==0 && !rotateOff) {
          int previ=i;
          int prevj=j;
          i=7-i;
          j=7-j;
          image(tab[board[previ+prevj*8].piece-1], i*sqrSize, j*sqrSize, sqrSize, sqrSize);
          i=previ;
          j=prevj;
        }
      }
    }
  }
}

void initBoard() {
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      board[i+j*8]=new sqr(i, j);
    }
  }
  tab[0]=loadImage("piezas/torre_blanca.png");
  tab[1]=loadImage("piezas/torre_negra.png");
  tab[2]=loadImage("piezas/reina_blanca.png");
  tab[3]=loadImage("piezas/reina_negra.png");
  tab[4]=loadImage("piezas/peon_blanco.png");
  tab[5]=loadImage("piezas/peon_negro.png");
  tab[6]=loadImage("piezas/rey_blanco.png");
  tab[7]=loadImage("piezas/rey_negro.png");
  tab[8]=loadImage("piezas/alfil_blanco.png");
  tab[9]=loadImage("piezas/alfil_negro.png");
  tab[10]=loadImage("piezas/caballo_blanco.png");
  tab[11]=loadImage("piezas/caballo_negro.png");
}

void setBoard() {
  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      if (j==1 )board[i+j*8].piece=5+1;
      if (j==6)board[i+j*8].piece=4+1;
    }
  }
  board[0].piece=1+1;
  board[7].piece=1+1;
  board[0+7*8].piece=0+1;
  board[7+7*8].piece=0+1;
  board[1].piece=11+1;
  board[6].piece=11+1;
  board[1+7*8].piece=10+1;
  board[6+7*8].piece=10+1;
  board[2].piece=9+1;
  board[5].piece=9+1;
  board[2+7*8].piece=8+1;
  board[5+7*8].piece=8+1;
  board[3].piece=3+1;
  board[4].piece=7+1;
  board[3+7*8].piece=2+1;
  board[4+7*8].piece=6+1;
}
