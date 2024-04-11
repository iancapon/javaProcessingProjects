int w=13;
int h=8;
box[]grid=new box[w*h];
box player;
ball ball;
box[]boundary=new box[3];

int subtick=10;
float tick=1.0/float(subtick);

void setup() {
  size(500, 800);
  player=new box(250, 750, 120, 10);
  ball=new ball(250, 400, 7, 6);
  boundary[0]=new box(0-10, 400, 20, 800);
  boundary[1]=new box(500+10, 400, 20, 800);
  boundary[2]=new box(250, 0-10, 500, 20);
  for (int i=0; i<w; i++) {
    for (int j=0; j<h; j++) {
      grid[i+j*w]=new box(28+i*37, 100+j*15, 37, 10);
    }
  }
  rectMode(CENTER);

  ball.u=random(-1, 1);
  ball.v=-sin(acos(ball.u))*ball.speed;
  ball.u*=ball.speed;
}

void draw() {
  background(0);
  player.show(0);
  ellipse(ball.x, ball.y, ball.r*2, ball.r*2);
  for (int i=0; i<w*h; i++) {
    grid[i].show(0);
  }
  for (int i=0; i<subtick; i++) {
    gameloop();
  }
  if (!keyPressed) {
    playerU=0;
  }
  textSize(50);
  text(puntaje, 400, 60);
  if (ball.y>800)fill(255, 0, 0);
}

int puntaje=0;

void gameloop() {
  int check=0;
  ball.update(tick);
  playerUpdate();
  //----------------------------------GRIDD
  for (int i=0; i<w*h; i++) {
    check=grid[i].check(ball.x, ball.y, ball.r);
    if (check>0) {
      ball.colision(grid[i], check, tick, 1);
      grid[i].x=600;
      puntaje++;
    }
  }
  //---------------------------------BOUNDARY
  check=0;
  for (int i=0; i<3; i++) {
    check=boundary[i].check(ball.x, ball.y, ball.r);
    if (check>0) {
      ball.colision(boundary[i], check, tick, 1);
    }
  }
  //---------------------------------PLAYER
  check=0;
  check=player.check(ball.x, ball.y, ball.r);
  if (check>0) {
    ball.colision(player, check, tick, 1);
  }
}

float playerU=0;
float playerV=0;
void playerUpdate() {
  player.x+=playerU*tick;
  player.y+=playerV*tick;
}

void keyPressed() {
  if (key==CODED && keyCode==LEFT) {
    playerU=-ball.speed*1.5;
  } else if (key==CODED && keyCode==RIGHT) {
    playerU=ball.speed*1.5;
  }
}
