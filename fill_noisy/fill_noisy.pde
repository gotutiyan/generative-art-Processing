int n=10;
Noise_Line nl[]=new Noise_Line[n];
void setup(){
  size(500,500);
  background(0);
  for(int i=0;i<n;i++){
    nl[i]=new Noise_Line(100,100+300/n*i,0f,300f);
  }
}

void draw(){
  //background(0);
  for(int i=0;i<n;i++){
   nl[i].show(); 
  }
}

class Noise_Line{
  PVector start;
  PVector prev;
  float rad=0,leng=0;
  int n=10;
  float noise_seed[]=new float[n];
  Noise_Line(int x,int y,float _rad,float _leng){
   start=new PVector(x,y);
   rad=_rad;
   leng=_leng;
   for(int i=0;i<n;i++)noise_seed[i]=random(0,100000);
  }
  
  void show(){
    prev=new PVector(0,0);
    pushMatrix();
    translate(start.x,start.y);
    if((millis()/10000)%2==0)stroke(255);
    else stroke(0);
    for(int i=0;i<n;i++){
      noise_seed[i]+=0.01;
      float r=leng/n*(i+1);
      float offset=map(noise(noise_seed[i]),0,1,-PI/20,PI/20);
      PVector next=new PVector(r*cos(rad+offset), r*sin(rad+offset));
      line(prev.x,prev.y,next.x,next.y);
      prev=next;
    }
    popMatrix();
  }
}