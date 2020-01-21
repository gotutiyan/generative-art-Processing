int n = 300;
float rad[] = new float[n];
int r = 200;
void setup(){
  size(500,500);
  for(int i=0;i<n;i++){
     rad[i] = map(i,0,n,0,2*PI);
  }
}

void draw(){
  background(0);
  translate(width/2, height/2);
  float t = map(cos(radians(2*frameCount)),-1,1,0,1);
  for(int i=0;i<n;i++){
     float per1 = t, per2 = 1.0-t;
     PVector pos = new PVector();
     if(2*frameCount%720 <= 180){
       pos = circle(rad[i],r).mult(per1).add(asteroid(rad[i],r).mult(per2));
     }else if(2*frameCount%720 <= 360){
       pos = lissajous(rad[i],r).mult(per1).add(asteroid(rad[i],r).mult(per2));
     }else if(2*frameCount%720 <= 540){
       pos = lissajous(rad[i],r).mult(per1).add(line_(rad[i],r).mult(per2));
     }else{
       pos = circle(rad[i],r).mult(per1).add(line_(rad[i],r).mult(per2));
     }
     ellipse(pos.x, pos.y,5,5);
  }
  
  
}

PVector circle(float rad, float radius){
  return new PVector(radius*cos(rad), 
                     radius*sin(rad));
}

PVector asteroid(float rad, float radius){
  return new PVector(radius*cos(rad)*cos(rad)*cos(rad),
                     radius*sin(rad)*sin(rad)*sin(rad));
}

PVector lissajous(float rad, float radius){
  return new PVector(radius*sin(3*rad), radius*sin(4*rad));
}

PVector line_(float rad, float radius){
  return new PVector(radius*cos(rad), radius*cos(rad));
}