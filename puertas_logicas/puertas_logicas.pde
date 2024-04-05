nodo[]array=new nodo[1000];
int max=1;//##### (num)
PImage[]foto=new PImage[9];
int keep=0;
boolean moving=false;
boolean switc=false;
void setup() {
  size(700, 500);
  rectMode(CENTER);
  for (int i=0; i<1000; i++) {
    array[i]=new nodo(30+i*10, 30, 60, 0);//##### (tipo y posicion)
  }

  foto[0]=loadImage("switch-on.png");
  foto[1]=loadImage("buffer.png");
  foto[2]=loadImage("not.png");
  foto[3]=loadImage("or.png");
  foto[4]=loadImage("and.png");
  foto[5]=loadImage("light-on.png");
  foto[6]=loadImage("light-off.png");
  foto[7]=loadImage("switch-off.png");
  foto[8]=loadImage("xor.png");
}


void draw() {
  background(255);
  fill(255);

  for (int i=0; i<max; i++) {
    nodeGrabCircuit(i);
    array[i].show();
    array[i].truth();
  }

  if (aux) {
    line(A.x, A.y, mouseX, mouseY);
  }
}

void nodeGrabCircuit(int i) {
  if (array[i].grabbed()) {
    if (array[i].type==0) {
      switc=true;
    }
    if (!moving) {
      moving=true;
      keep=i;
    }
  }
  if (moving && keep==i) {
    array[i].move();
  }
  if (moving && keep==i && !array[i].grabbed()) {
    moving=false;
  }
}


boolean aux=false;
outlet A;

void outletGrabCircuit(int i, int j) {
  if (array[i].outlet[j].grabbed() && !aux ) {
    A=array[i].outlet[j];
    aux=true;
  }

  if (array[i].outlet[j].grabbed() && aux && array[i].outlet[j]!=A) {
    A.coneccion(array[i].outlet[j]);        //<<<-------            //##### conecciones
    aux=false;
  }

  if (mousePressed && !array[i].outlet[j].grabbed()) {
    aux=false;
  }
}


void mouseReleased() {
  for (int i=0; i<max; i++) {
    if (array[i].type<5) {
      outletGrabCircuit(i, 0);
      if (array[i].type ==1 || array[i].type ==2) {
        outletGrabCircuit(i, 3);
      }
      if (array[i].type >2) {
        outletGrabCircuit(i, 1);
        outletGrabCircuit(i, 2);
      }
    }
    if (array[i].type==5) {
      outletGrabCircuit(i, 3);
    }

    if (array[i].type==6) {
      outletGrabCircuit(i, 0);
      outletGrabCircuit(i, 1);
      outletGrabCircuit(i, 2);
    }
  }

  if (switc && array[keep].type==0) {
    array[keep].outlet[0].value*=-1;
    switc=false;
  }
}
void keyPressed() {
  if (key==' ') {
    max++;
  }
  if (key=='+') {
    if (array[max-1].type<6)
      array[max-1].type+=1;
  }
  if (key=='-') {
    if (array[max-1].type>0)
      array[max-1].type-=1;
  }
}
