class ball {
  float x, y, u, v, g;
  int r;
  public ball(float x, float y, int r) {
    this.x=x;
    this.y=y;
    this.r=r;
    u=0;
    v=0;
    g=0.1;
  }

  void update(float dtime) {
    v+=g*dtime;
    x+=u*dtime;
    y+=v*dtime;
    if(v>8)v=8;
    if(v<-8)v=-8;
  }

  void colision(box box, int wall, float dtime, float e) {
    if (wall%2==0) {//y
      float py=y;
      int signo=1;
      if (wall==4)signo=-1;
      this.y+=e*signo*(box.delta[wall-1]-0)*dtime;
      this.v=-signo*0.1+e*(py-y)/dtime;

    } else {//x
      float px=x;
      int signo=1;
      if (wall==3)signo=-1;
      this.x+=e*signo*(box.delta[wall-1]+1)*dtime;
      this.u=-signo*0.1+e*(px-x)/dtime;
    }
  }
}
