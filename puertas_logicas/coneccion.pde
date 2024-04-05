
class outlet {
  int x, y, size;
  outlet []conn=new outlet[10];
  int value;
  int connected;
  int shade=255;
  public outlet(int x, int y, int size) {
    this.x=x;
    this.y=y;
    this.size=size;
    this.connected=0;
    this.value=-1;
  }
  void show() {
    if (value>0)shade=255;
    else shade=100;
    fill(shade,100,100);
    rect(x, y, size, size);
    if (connected>0) {
      stroke(255, 0, 0);
      for(int i=0; i<connected;i++)
        line(x, y, conn[i].x, conn[i].y);
    }
    
    stroke(0);
    if(connected>0){
      for(int i=0; i<connected;i++)
      //if(conn[i].value==-1)
        conn[i].value=this.value;
    }
  }

  void coneccion(outlet P) {
    conn[connected]=P;
    connected++;
    //if(P.value==-1)
      P.value=this.value;
  }



  boolean grabbed() {
    boolean ret=false;
    if (mouseButton==LEFT) {
      int targetX=x-size/2;
      int targetY=y-size/2;
      if (mouseX>targetX && mouseX<targetX+size && mouseY>targetY && mouseY<targetY+size) {
        ret=true;
      }
    }

    return ret;
  }

  boolean move() {
    boolean ret=false;
    if (grabbed()) {
      x=mouseX;
      y=mouseY;
      ret=true;
    }
    return ret;
  }

}
