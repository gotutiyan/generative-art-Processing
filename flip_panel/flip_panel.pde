int n=10,sz;
Flip fp[][]=new Flip[n][n];
void setup(){
  size(500,500);
  sz = width/n;
  rectMode(CENTER);
  for(int i=0;i<n*n;i++){
    fp[i/n][i%n] = new Flip(new PVector(sz*0.5+int(i/n)*sz,sz*0.5+(i%n)*sz));
  }
}

void draw(){
  background(0);
  for(int i=0;i<n*n;i++)fp[i/n][i%n].move();
}
class Flip{
  PVector p;
  Flip(PVector p){
    this.p = p;
  }
  void move(){
    float s = sz*sin(frameCount/32.0 + p.x+p.y);
    stroke(255*(1-int(s<0)));
    fill(int(s<0)*255);
    rect(p.x,p.y,s,sz);
  }
}
