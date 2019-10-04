int n=10;
Circle c,cc;
Circle pic[]=new Circle[n];
void setup(){
  size(500,500);
  //c=new Circle(50,0,PI/120);
  //cc=new Circle(70,0,PI/120);
  for(int i=0;i<n;i++){
    pic[i]=new Circle(20+10.0*i,0,PI/120.0);
  }
}

void draw(){
 background(0);
 translate(width/2,height/2);
 //c.show();
 //cc.show();
 for(int i=0;i<n;i++){
  pic[i].show(); 
 }
 stroke(255);
}

class Circle{
 PVector pos;
 float radius;
 float rad,rad_sp;
 Circle(float _radius, float _rad, float _rad_sp){
  pos=new PVector(width/2,height/2);
  radius=_radius;
  rad=_rad;
  rad_sp=_rad_sp;
 }
 
 void show(){
  for(int i=0;i<100;i++){
   //float r=(radius+100)*max(0,sin(rad+PI/100.0*i));
   float r=(radius)*max(0,sin(rad+PI/10.0*i))+100;
   float x=r*cos(2*PI/100.0*i);
   float y=r*sin(2*PI/100.0*i);
   ellipse(x,y,2,2);
  }
  rad+=rad_sp; 
 }
}