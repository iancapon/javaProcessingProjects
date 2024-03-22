class pointMass {
  float x, y, u, v, m, G, gx, gy;
  int radio;
  public pointMass(float x, float y, float m,int radio,float G) {
    this.x=x;
    this.y=y;
    this.m=m;
    u=0;
    v=0;
    this.G=G;
    gx=0;
    gy=0;
    this.radio=radio;
  }
  void field(pointMass[]array, int max) {
    gx=0;
    gy=0;
    for (int i=0; i<max; i++) {
      float dx=this.x-array[i].x;
      float dy=this.y-array[i].y;
      float distance=sqrt(dx*dx+dy*dy);
      if (distance>1) {
        gx+=-(dx/distance)*G*array[i].m/(this.m*distance*distance);
        gy+=-(dy/distance)*G*array[i].m/(this.m*distance*distance);
      }
    }
  }

  void euclid(float delta) {
    u+=gx*delta;
    v+=gy*delta;
    x+=u*delta;
    y+=v*delta;
  }

  void show() {
    float shade=130-(int)255*sqrt(u*u+v*v)/5;
    fill(shade,255,255);
    int px=(int)x+1920/2;
    int py=(int)y+1080/2;
    
    ellipse(px,py, radio*2, radio*2);
  }
  void show(color shade) {

    int px=(int)x+1920/2;
    int py=(int)y+1080/2;
    fill(shade);
    ellipse(px,py, radio*2, radio*2);
  }
  
  void interact(pointMass[]other, int max, float tolerance, float delta) {
    int timestep=1;//(int)(1/delta);
    for (int i=1; i<max; i++) {
      float dx=this.x-other[i].x;
      float dy=this.y-other[i].y;
      float distance=sqrt(dx*dx+dy*dy);
      if (distance<radio+other[i].radio && distance>1) {
        float ejeColisionX=(this.x-other[i].x)/distance;
        float ejeColisionY=(this.y-other[i].y)/distance;
        //float delta=r+other[i].r-distance;

        float prevx=x;
        float prevy=y;

        x+=ejeColisionX*delta*tolerance/timestep;
        y+=ejeColisionY*delta*tolerance/timestep;

        u+=(x-prevx)*timestep*tolerance/m;
        v+=(y-prevy)*timestep*tolerance/m;
      }
    }
  }
}
