void setup(){
  size(500,500);
}
void draw(){
  background(0);
  int n = 360;
  fill(255);
  translate(width/2,height/2);
  for(int i=0;i<n;i++){
    float t = map(sin(2*PI/n*i),-1,1,0,1);
    float time = frameCount/128.0;
    float theta = (2.0*PI)/n*i+time;
    float x = t*cos(theta) + (1-t)*cos(theta)*cos(theta)*cos(theta);
    float y = t*sin(theta) + (1-t)*sin(theta)*sin(theta)*sin(theta);
    ellipse(x*200,y*200,5,5);
  }
}