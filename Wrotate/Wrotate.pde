int n=10,r=200;
int cube_sz=97;
RotateCube rc[]=new RotateCube[n];

void setup(){
  size(500,500);
  rectMode(CENTER);
  for(int i=0;i<n;i++){
    rc[i]=new RotateCube(2*PI/n*i,0.02);
  }
}

void draw(){
  smooth();
  background(255);
  translate(width/2,height/2);
  for(int i=0;i<n;i++)rc[i].show();
}

class RotateCube{
  float rad,rotate_sp;
  float rtt=0;
  RotateCube(float rad,float rotate_sp){
    this.rad=rad;
    this.rotate_sp=rotate_sp;
    rtt=rad;
  }
  
  void show(){
    pushMatrix();
    PVector pos=new PVector(r*cos(rad), r*sin(rad));
    translate(pos.x, pos.y);
    rotate(rtt);
    rect(0,0,cube_sz,cube_sz);
    popMatrix();
    rtt+=rotate_sp;
    rad+=0.01;
  }
}