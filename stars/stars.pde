int n=100;
Star s[] = new Star[n];
void setup(){
  size(500,500);
  colorMode(HSB, 360,255,255);
  noFill();
  for(int i=0;i<n;i++){
    s[i] = new Star();
    s[i].init();
  }
}

void draw(){
  background(0); 
  translate(width/2, height/2);
  for(int i=0;i<n;i++){
    s[i].move();
  }
}

class Star{
  PVector pos, sp_vec;
  float sz;
  float noise_seed;
  
  void init(){
    int sp_vec_x=int(random(1,7));
    this.sp_vec = new PVector(pos_ng()*sp_vec_x, pos_ng()*(7-sp_vec_x));
    this.pos = new PVector(0,0);
    this.sz = random(10,50);
    this.noise_seed = random(100000);
  }
  
  void move(){
    PVector center = new PVector(0,0);
    stroke(map(center.dist(pos),0,1.3*width/2,0,360),255,255);
    pos.add(sp_vec);
    beginShape();
    for(float rad=0;rad<=2*PI;rad+=2*PI/5){
      PVector point=_circle(rad,sz);
      PVector point_small = _circle(rad+PI/5,sz/2);
      vertex(pos.x+point.x, pos.y+point.y);
      vertex(pos.x+point_small.x, pos.y+point_small.y);
    }
    endShape();
    initialize();
  }
  
  PVector _circle(float rad, float sz){
    return new PVector(sz*cos(rad), sz*sin(rad));
  }
  
  void initialize(){
    if(abs(pos.x)+sz>width || abs(pos.y)+sz>height){
      init();
    }
  }
}

// return 1 or -1
int pos_ng(){
  return (int(random(11))%2==0?1:-1);
}
