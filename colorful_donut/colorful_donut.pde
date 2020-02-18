int n = 100;
Line l[] = new Line[n];
ParticleLine pl = new ParticleLine(new PVector(0,height/2), new PVector(width,height/2));
void setup(){
  size(500,500);
  for(int i=0;i<n;i++){
    l[i] = new Line(2*PI/n*i, 2*PI/n*(i+1), i/30.0);
  }
  strokeWeight(2);
  colorMode(HSB,360,255,255);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(int i=0;i<n;i++){
    l[i].show();
  }
  resetMatrix();
  //pl.show();
  
}

class Line{
  float radians1, radians2;
  float r = 150;
  float mid_r_seed;
  Line(float radians1, float radians2, float mid_r_seed){
    this.radians1 = radians1;
    this.radians2 = radians2;
    this.mid_r_seed = mid_r_seed;
  }
  
  void show(){
    float mid_radians = (radians1+radians2) / 2.0;
    PVector pos1 = new PVector(r*cos(radians1), r*sin(radians1));
    PVector pos2 = new PVector(r*cos(radians2), r*sin(radians2));
    float mid_r = max(50, (r*1.5)*cos(mid_r_seed));
    float c = 255;
    if(mid_r>50) c = map(mid_r, 50, r*1.5, 0, 360);
    PVector mid_pos = new PVector(mid_r*cos(mid_radians), mid_r*sin(mid_radians));
    stroke(c,(c==255?0:255), 255);
    line(pos1.x, pos1.y, mid_pos.x, mid_pos.y);
    line(mid_pos.x, mid_pos.y, pos2.x, pos2.y);
    
    mid_r_seed += PI/128;
  }
}

class ParticleLine{
  PVector pos1, pos2;
  int N = 3;
  ParticleLine(PVector pos1, PVector pos2){
    this.pos1 = pos1;
    this.pos2 = pos2;
  }
  
  void show(){
    blendMode(ADD);
    for(int i=N-1;i>=0;i--){
      float c = map(i,0,N,0,255);
      stroke(255,c,c);
      line(pos1.x, pos1.y, pos2.x, pos2.y);
    }
  }
}