int n = 10;
int sz = 500/n;
int cycle = 60;
int idx1=0, idx2=0;
PVector center = new PVector(0,0);
void setup(){
  size(500,500);
  noFill();
  stroke(255);
}

void draw(){
  //background(0,);
  fill(0,100);
  rect(-10,-10,width+10,height+10,10);
  noFill();
  float rad = map(frameCount%cycle, 0, cycle-1, 0, PI);
  if(frameCount%cycle==0){
    idx1 = int(random(n*n));
    idx2 = int(random(n*n));
    center = cluc_center(idx1,idx2);
    //println(idx1, idx2, center);
  }
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      int eps = 5;
      if((i==idx1/n && j== idx1%n) || (i==idx2/n && j==idx2%n)){
        translate(center.x, center.y);
        rotate(rad);
        fill(map(abs(rad-PI/2), 0, PI/2, 255, 0));
        rect(eps+sz*i-center.x, eps+sz*j-center.y, sz-2*eps, sz-2*eps);
        resetMatrix();
      }else{
        noStroke();
        fill(150);
        rect(3+eps+sz*i, 3+eps+sz*j, sz-2*eps, sz-2*eps);
        
        stroke(255);
        fill(0);
        rect(eps+sz*i, eps+sz*j, sz-2*eps, sz-2*eps);
        
      }
    }
  }
}

PVector cluc_center(int idx1, int idx2){
  float x = (idx1/n*sz+sz/2.0 + idx2/n*sz+sz/2.0) / 2.0;
  float y = (idx1%n*sz+sz/2.0 + idx2%n*sz+sz/2.0) / 2.0;
  return new PVector(x,y);
}
