int n = 50;
float rad[] = new float[n];
void setup(){
  size(500,500);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  fill(255);
  scale(20);
  for(int i=0;i<n;i++){
    float x = 6*cos(rad[i]) - cos(6*rad[i]);
    float y = 6*sin(rad[i]) - sin(6*rad[i]);
    ellipse(x, y, 5, 5);
    rad[i] += i*0.001;
  }
  
}

void keyPressed(){
  for(int i=0;i<n;i++)rad[i]=0;
}