int n = 10;
TwinCircle tc[][] = new TwinCircle[n][n];
void setup(){
  size(500,500);
  for(int i=0;i<n;i++){
   for(int j=0;j<n;j++){
    tc[i][j] = new TwinCircle((i+j)/5.0);
   }
  }
}

void draw(){
  background(#FFFDD6);
  int leng = width / n;
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      pushMatrix();
      translate(leng/2*i + leng*2.5, leng/2*j + leng*2.5);
      tc[i][j].show();
      popMatrix();
    }
  }
  
}

class TwinCircle{
  float seed,r=50;
  TwinCircle(float seed){
    this.seed = seed;
  }
  
  void show(){
    float radians1 = map(sin(seed),-1,1,0,PI);
    float radians2 = radians1 + PI;
    PVector pos1 = new PVector(r*cos(radians1), r*sin(radians1));
    PVector pos2 = new PVector(r*cos(radians2), r*sin(radians2));
    color c1 = color(255 - map(radians1,0,PI,0,360));
    color c2 = color(255 - map(radians2,PI,2*PI,360,0));
    fill(c1);
    stroke(c2);
    ellipse(pos1.x, pos1.y, 50, 50);
    fill(c2);
    stroke(c1);
    ellipse(pos2.x, pos2.y, 50, 50);
    seed += PI/128;
  }
}