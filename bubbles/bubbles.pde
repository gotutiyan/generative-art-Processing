int LAYER = 5;
int N = 10;
C c[][] = new C[LAYER][N];
void setup(){
  size(500,500);
  stroke(255);
  strokeWeight(3);
  noFill();
  for(int j=0;j<LAYER;j++){
    for(int i=0;i<N;i++){
      float rad = TAU / N * i;
      float r = 100 / LAYER * j;
      c[j][i] = new C(new PVector(cos(rad), sin(rad)), r);
    }
  }
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(int j=0;j<LAYER;j++){
    for(int i=0;i<N;i++){
      c[j][i].move();
    }
  }
}

class C{
  PVector dir, pos;
  float r;
  
  C(PVector dir_, float r_){
    pos = new PVector(0,0);
    dir = dir_;
    r = r_;
  }
  
  void init(){
    pos = new PVector(0,0);
    r = 100;
  }
  
  void move(){
    pos.add(dir);
    circle(pos.x, pos.y, r);
    r = max(0, r-0.5);
    if(r == 0) init();
  }
  
}
