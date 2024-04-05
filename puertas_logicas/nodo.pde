class nodo {
  int x, y;
  int size;
  int type;
  int shade=255;
  outlet []outlet=new outlet[4];
  public nodo(int x, int y, int size, int type) {
    this.x=x;
    this.y=y;
    this.size=size;
    this.type=type;
    outlet[0]=new outlet(x+size/2+5, y, 10);
    outlet[1]=new outlet(x-size/2-5, y-size/3, 10);
    outlet[2]=new outlet(x-size/2-5, y+size/3, 10);
    outlet[3]=new outlet(x-size/2-5, y, 10);
  }

  void truth() {
    rectMode(CENTER);
    if (type==0) {
      int v=outlet[0].value;
      if (v>0) {
        //shade=255;
        fill(0);
        image(foto[0], x-25, y-25, 50, 50);
      } else {
        //shade=100;
        //fill(0);
        image(foto[7], x-25, y-25, 50, 50);
      }
    }//value
    if (type==1) {
      //fill(0);
      image(foto[1], x-25, y-25, 50, 50);
      shade=255;
    }//buffer
    if (type==2) {
      //fill(0);
      image(foto[2], x-25, y-25, 50, 50);
      int v=outlet[3].value;
      outlet[0].value=v*(-1);
    }//not
    if (type==3) {
      //fill(0);
      image(foto[3], x-25, y-25, 50, 50);
      int a=outlet[1].value;
      int b=outlet[2].value;
      int v=-1;
      if (a>0||b>0) {
        v=1;
      }
      outlet[0].value=v;
    }//or
    if (type==4) {
      //fill(0);
      image(foto[4], x-25, y-25, 50, 50);
      int a=outlet[1].value;
      int b=outlet[2].value;
      int v=-1;
      if (a>0 && b>0) {
        v=1;
      }
      outlet[0].value=v;
    }//and
    if (type==5) {
      //fill(0);

      float v=outlet[3].value;
      if (v>0) {
        shade=255;
        image(foto[5], x-25, y-25, 50, 50);
      } else {
        shade=100;
        image(foto[6], x-25, y-25, 50, 50);
      }
    }//output
    if (type==6) {
      shade=255;
      image(foto[8], x-25, y-25, 50, 50);
      int a=outlet[1].value;
      int b=outlet[2].value;
      int v=-1;
      if (a>0||b>0) {
        v=1;
      }
      if(a==1 && b==1){
        v=-1;
      }
      outlet[0].value=v;
    }//xor
  }
  void show() {
    fill(shade);
    rect(x, y, size, size);

    //output
    outlet[0].x=x+size/2+5;
    outlet[0].y=y;

    //input A
    outlet[1].x=x-size/2-5;
    outlet[1].y=y-size/3;

    //input B
    outlet[2].x=x-size/2-5;
    outlet[2].y=y+size/3;

    //input lonely
    outlet[3].x=x-size/2-5;
    outlet[3].y=y;

    //for (int i=0; i<3; i++) {
    //  outlet[i].show();
    //}
    if (type<5) {
      outlet[0].show();

      if (type==1 || type==2)
        outlet[3].show();

      if (type>2) {
        outlet[1].show();
        outlet[2].show();
      }
    }
    if (type==5) {
      outlet[3].show();
    }
    
    if (type==6) {
      outlet[0].show();
      outlet[1].show();
      outlet[2].show();
    }
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

  float move() {
    float ret=0;
    if (grabbed()) {
      ret=sqrt(pow(x-mouseX,2)+pow(y-mouseY,2));
      x=mouseX;
      y=mouseY;
    }
    return ret;
  }
}
