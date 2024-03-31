nodo[]array=new nodo[1000];
int max=1;
void setup() {
  size(500, 500);
  rectMode(CENTER);
  for (int i=0; i<1000; i++) {
    array[i]=new nodo(30+i*10, 30, 50, 0);
  }
}
int keep=0;
boolean moving=false;
void nodeGrabCircuit(int i) {
  if (array[i].grabbed() && !moving) {
    moving=true;
    keep=i;
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
    A.coneccion(array[i].outlet[j]);
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
  }
  
  
}
void keyPressed() {
  if (key==' ') {
    max++;
  }
  if (key=='+') {
    if (array[max-1].type<5)
      array[max-1].type+=1;
  }
  if (key=='-') {
    if (array[max-1].type>0)
      array[max-1].type-=1;
  }
  if (key=='a' && moving && array[keep].type==0) {
    array[keep].outlet[0].value*=-1;
  }
}


void draw() {
  background(50);

  for (int i=0; i<max; i++) {
    nodeGrabCircuit(i);
    array[i].show();
    array[i].truth();
  }

  if (aux) {
    line(A.x, A.y, mouseX, mouseY);
  }
  
  
}
