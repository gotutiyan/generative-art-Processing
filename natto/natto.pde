class Ball{
 PVector pos;
 PVector speed;
 float r=10;
 Ball(PVector pos,PVector speed){
  this.pos=pos;
  this.speed=speed;
 }
 
 void show(){
   ellipse(pos.x,pos.y,r,r);
   pos.add(speed);
   if(pos.x-r/2<0){
     speed.x*=-1;
     pos.x=r/2+1;
   }
   if(pos.x+r/2>width){
     speed.x*=-1;
     pos.x=width-r/2-1;
   }
   if(pos.y-r/2<0){
     speed.y*=-1;
     pos.y=r/2+1;
   }
   if(pos.y+r/2>height){
     speed.y*=-1;
     pos.y=height-r/2-1;
   }
 }
}
int N=40;
Ball ball[]=new Ball[N];

void setup(){
  size(500,500);
  colorMode(HSB,360,100,100);
  stroke(255,0,100);
  for(int i=0;i<N;i++){
    ball[i]=new Ball(new PVector(random(width),random(height)),
                        new PVector(random(-2,2),random(-2,2)));
  }
}

void draw(){
  background(0);
  strokeWeight(1);
  //stroke(255);
  for(int i=0;i<N;i++){
   ball[i].show(); 
  }
  for(int i=0;i<N;i++){
   for(int j=i+1;j<N;j++){
     if(ball[i].pos.dist(ball[j].pos)<100){
       strokeWeight(map(ball[i].pos.dist(ball[j].pos),0,100,5,0));
       //stroke(map(ball[i].pos.dist(ball[j].pos),0,100,360,70),100,100);
       line(ball[i].pos.x,ball[i].pos.y,ball[j].pos.x,ball[j].pos.y);
     }
   }
  }
}