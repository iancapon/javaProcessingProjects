class box {
  float x, y, w, h;
  //float deltaxleft;
  //float deltaxright;
  //float deltayup;
  //float deltaydown;
  float delta[]=new float[4];
  public box(float x, float y, float w, float h) {
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
  }

  void show(int d) {
    rect(x+d, y, w, h);
  }
  int check(float x, float y, int r) {
    int wall=0;
    float xleft=this.x-r-w/2;
    float yup=this.y-r-h/2;
    delta[0]=x-xleft;//positive=colision
    delta[1]=y-yup;
    delta[2]=w+2*r-delta[0];
    delta[3]=h+2*r-delta[1];
    
    if (delta[0]>=0 && delta[0]<w+2*r && delta[1]>=0 && delta[1]<=h+2*r) {

      float min=10000;
      for (int i=0; i<4; i++) {
        if (delta[i]<min) {
          wall=i+1;
          min=delta[i];
        }
      }
    }

    return wall;
  }
  //void constraint() {
    
  //}
}
