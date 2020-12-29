float time=0,x=0;
int n=10;
LoadRect lr[][] = new LoadRect[n][n];
void setup(){
  size(500,500);
  fill(100);
  rectMode(CENTER);
  //frameRate(10);
  float leng = width/n;
  for(int i=0;i<n;i++){
   for(int j=0;j<n;j++){
     lr[i][j] = new LoadRect(new PVector(leng/2+i*leng, leng/2+j*leng),
                             leng);
   }
  }
}

void draw(){
  background(255);
  for(int i=0;i<n;i++){
   for(int j=0;j<n;j++){
     lr[i][j].show();
   }
  }
}

float sigmoid(float x){
 return 1./(1.+pow(2.718, x)); 
}

class LoadRect{
  PVector pos;
  int shape_seed, rotate_seed=0;
  float leng, rad=0;
  LoadRect(PVector pos, float leng){
    this.pos = pos;
    this.leng = leng;
    this.shape_seed = int(random(0,3));
    this.rotate_seed = int(random(0,2));
  }
  
  void show(){
    strokeWeight(5);
    translate(pos.x, pos.y);
    int unit_time = 60;
    float x = map(frameCount%unit_time, 0, unit_time-1, -20, 20);
    float add_rad = map(sigmoid(x), 0, 1, 0, PI/2);
    if(rotate_seed == 0) rotate(rad + add_rad);
    else rotate(rad - add_rad);
    if(shape_seed == 0){
      rect(-leng/3, 0, leng/3, leng);
      rect(leng/3, 0, leng/3, leng);
    }else if(shape_seed == 1){
      rect(0, -leng/3, leng, leng/3);
      rect(0, leng/3, leng, leng/3);
    }else if(shape_seed == 2){
      rect(-leng/3, -leng/3, leng/3, leng/3);
      rect(leng/3, -leng/3, leng/3, leng/3);
      rect(-leng/3, leng/3, leng/3, leng/3);
      rect(leng/3, leng/3, leng/3, leng/3);
    }
    resetMatrix();
    
    // Update base radians
    if(frameCount % unit_time == unit_time-1){
      if(rotate_seed == 0) rad += PI/2;
      else rad -= PI/2;
      rotate_seed = int(random(0,2));
    }
  }
}
