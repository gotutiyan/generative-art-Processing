float s[]=new float[10];
int i=0;
void setup(){
  size(500,500);
  for(;i<10;i++)s[i]=0;
}

void draw(){
  background(0);
  translate(250,250);
   i=0;
  for(;i<10;i++){
    s[i]+=(i+1)/3.0;
    float x=radians(s[i]);
    rotate(x);
    rect(50,50,400,400);
    rotate(x);
  }
}