int top=100;
int cap=15;
box []level=new box[top];
box box;
ball ball;
void setup() {
  size(1000, 600);
  for (int i=0; i<top; i++) {
    level[i]=new box(i*100+50, 600+(int)random(0, 2)*50, 100, 500);
    if(i==20 || i==21)level[i]=new box(i*100+50,300,100,10);
  }
  ball=new ball(350, 50, 10);
  rectMode(CENTER);
}

int substeps=20;
float dtime=1.0/(float)substeps;
int scroll=0;
void draw() {
  background(200);
  noFill();
  for (int i=0; i<100; i++) {
    //level[i].x=ball.x+ball.u*dtime;
    level[i].show(350-(int)(ball.x+ball.u*dtime));
  }
  ellipse(350, ball.y, ball.r*2, ball.r*2);
  for (int i=0; i<substeps; i++) {
    gameloop();
  }
  scroll++;
  if(!keyPressed){
    ball.u=0;
  }
  //onGround=false;
}

void gameloop() {
  int check=0;
  ball.update(dtime);
  for (int i=0; i<100; i++) {
    check=level[i].check(ball.x, ball.y, ball.r);
    if (check>0) {
      ball.colision(level[i], check, dtime, 1);
    }
    if(check==2)onGround=true;
  }
  
  
}

boolean onGround=false;
void keyPressed() {
  
  if (key==CODED && keyCode==UP && onGround) {
    ball.v-=5;
    onGround=false;
  }
  else if (key==CODED && keyCode==LEFT) {
    ball.u=-3;
  }
  else if (key==CODED && keyCode==RIGHT) {
    ball.u=3;
  }
  
}
