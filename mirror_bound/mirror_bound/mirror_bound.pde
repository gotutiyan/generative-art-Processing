int w,h;
Point pt;
void setup(){
  size(500,500);
  background(#ffffff);
  stroke(#999999);
  w=h=width/2;
  line(0,h,width,h);
  line(w,0,w,height);
  pt=new Point();
}

void draw(){
  pt.show();
}

boolean frame_in_x(PVector pos,PVector speed){return 0<=pos.x+speed.x&&pos.x+speed.x<w;}
boolean frame_in_y(PVector pos,PVector speed){return 0<=pos.y+speed.y&&pos.y+speed.y<h;}

class Point{
  PVector pos;
  PVector speed=new PVector(0,0);
  PVector prev=new PVector(-1,-1);
  Point(){
     //this.pos=new PVector(random(0,w),random(0,h));
     pos=new PVector(w,h);
     speed=new PVector(random(1.0,5.0),random(1.0,5.0));
     prev=pos;
  }
  
  void show(){
    prev=pos.copy();
    pos.add(speed);
    if(!frame_in_x(pos,speed))speed.x*=-1;
    if(!frame_in_y(pos,speed))speed.y*=-1;
    draw_line(prev,pos);
  }
  
  void draw_line(PVector prev,PVector pos){
    
    line(prev.x,prev.y,pos.x,pos.y);
    line(width-prev.x,prev.y,width-pos.x,pos.y);
    line(prev.x,height-prev.y,pos.x,height-pos.y);
    line(width-prev.x,height-prev.y,width-pos.x,height-pos.y);
  }
  
}

void keyPressed(){
 setup();
}