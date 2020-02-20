int n = 10, leng = 0;
float t = 0;
Asteroid a[][] = new Asteroid[n][n]; 
void setup(){
  size(500,500);
  stroke(255);
  smooth();
  noFill();
  leng = width/n;
  for(int i=0;i<n*n;i++)a[i/n][i%n] = new Asteroid(leng/2.0);
}

void draw(){
  background(0);
  t += PI/128.0;
  if(t%PI >= PI/2){
    strokeWeight(3);
    for(int i=0;i<n;i++){
      for(int j=0;j<n;j++){
        translate(i*leng + leng/2.0, j*leng + leng/2.0);
        rotate(t);
        a[i][j].show();
        resetMatrix();
      }
    }
  }else{
    strokeWeight(3);
    for(int i=0;i<n+2;i++){
      for(int j=0;j<n+2;j++){
        if(i%2==0)translate(i*leng, j*leng + map(t%PI,0,PI/2,0,leng));
        else translate(i*leng, j*leng - map(t%PI,0,PI/2,0,leng));
        circle(0, 0, leng);
        resetMatrix();
      }
    }
  }
  
}

class Asteroid{
  float r;
  int num = 30;
  Asteroid(float r){
    this.r = r;
  }
  
  float mul3(float x){
    return x*x*x;
  }
  
  void show(){
    for(int i=0;i<num;i++){
      float rad1 = map(i,0,num,0,2*PI);
      float rad2 = map(i+1,0,num,0,2*PI);
      line(r*mul3(cos(rad1)), r*mul3(sin(rad1)), r*mul3(cos(rad2)), r*mul3(sin(rad2)));
    }
  }
}
