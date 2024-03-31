class outlet {
  int x, y, size;
  outlet conn;
  int value;
  boolean connected;
  int shade=255;
  public outlet(int x, int y, int size) {
    this.x=x;
    this.y=y;
    this.size=size;
    this.connected=false;
    this.value=-1;
  }
  void show() {
    if (value>0)shade=255;
    else shade=100;
    fill(shade,100,100);
    rect(x, y, size, size);
    if (connected) {
      stroke(255, 0, 0);
      line(x, y, conn.x, conn.y);
    }
    
    stroke(0);
    if(connected){
      conn.value=this.value;
    }
  }

  void coneccion(outlet P) {
    conn=P;
    connected=true;
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
