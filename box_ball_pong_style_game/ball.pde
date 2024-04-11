class ball {
  float x, y, u, v, g,speed;
  int r;
  public ball(float x, float y, int r, float speed) {
    this.x=x;
    this.y=y;
    this.r=r;
    u=0;
    v=0;
    g=0;
    this.speed=speed;
  }

  void update(float dtime) {
    x+=u*dtime;
    y+=v*dtime;
    if(v>speed)v=speed;
    if(v<-speed)v=-speed;
    if(u>speed)u=speed;
    if(u<-speed)u=-speed;
  }

  void colision(box box, int wall, float dtime, float e) {
    if (wall%2==0) {//y
      float py=y;
      int signo=1;
      if (wall==4)signo=-1;
      this.y+=signo*(box.delta[wall-1])*dtime;
      this.v=-this.v*e+(py-y)/dtime;

    } else {//x
      float px=x;
      int signo=1;
      if (wall==3)signo=-1;
      this.x+=signo*(box.delta[wall-1])*dtime;
      this.u=-this.u*e+(px-x)/dtime;
    }
  }
}
