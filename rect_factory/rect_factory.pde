class Rect{
  float x,y,w,h;
  float speed;
  color c;
  boolean is_nofill=false;
  Rect(float x,float y,float w,float h,float speed){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.speed=speed; //-1 or 1
    set_color();
    is_nofill=false;
  }
  
  void show(){
    if(is_nofill){
      noFill();
      strokeWeight(2);
      stroke(c);
    }
    else {
      stroke(0,0,0);
      strokeWeight(1);
      fill(c);
    }
    rect(x,y,w,h);
    if(speed==1 && x>width){
      x=-w-1;
      set_color();
    }
    if(speed==-1 && x+w<0){
      x=width+1;
      set_color();
    }
    if(frameCount%(w+20)<w+2)x+=speed;
  }
  
  void set_color(){
    c=color(random(360),100,100);
    is_nofill=(random(0,50)<1.0?true:false);
  }
}

int N=10;
Rect rc[][]=new Rect[N+1][N/2];

void setup(){
  size(500,500);
  colorMode(HSB,360,100,100);
  
  for(int i=0;i<N+1;i++){
    for(int j=0;j<N/2;j++){
      rc[i][j]=new Rect(width/(N)*i+2*(j%2),height/(N)*2*j+height/(N)/2,
                          width/(N)-2,height/(N)-2,(j%2==0?-1:1));
    }
  }
}

void draw(){
  background(0);
  for(int i=0;i<N+1;i++){
    for(int j=0;j<N/2;j++){
      rc[i][j].show();
    }
  }
  
}