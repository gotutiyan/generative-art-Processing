color bc[]={#000000,#FFFFFF};
int n=50;
Rotate_Tri rt[][][]=new Rotate_Tri[2][50][50];
void setup(){
  size(500,500);
  for(int mode=0;mode<2;mode++)
    for(int i=0;i<n;i++)
      for(int j=0;j<n;j++)
        rt[mode][i][j]=new Rotate_Tri(100*j-100-50*mode-1000,84*i-84,100,mode);
}

void draw(){
  if(millis()%6000<3000)background(0);
  else background(255);
    for(int i=0;i<n;i++)
      for(int j=0;j<n;j++)
        if(millis()%6000<3000)
          rt[0][i][j].show();
        else 
          rt[1][i][j].show();
  
}

class Rotate_Tri{
  PVector pos;
  float rad=0;
  float r;
  int mode;
  Rotate_Tri(float x,float y,float _r,int _mode){
    pos=new PVector(x,y);
    r=_r;
    mode=_mode;
    rad=(mode==0?0:PI);
  }
  
  void show(){
    translate(pos.x+(millis()/3000-1)%2*50,pos.y);
    translate(r*cos(0),r*sin(0));
    if(millis()%6000<3000){
      if(mode==0){
        rad=PI/3*4/3000*(millis()%6000);
        fill(255);
      }
    }else {
      if(mode==1){
        rad=PI/3*4/3000*(millis()%6000-3000)+PI;
        fill(0);
      }
    }
    rotate(rad);
    beginShape();
    vertex(0,0);
    for(int i=1;i<3;i++){
      vertex(r*cos(PI/3*i),r*sin(PI/3*i));
    }
    endShape();
    resetMatrix();
  }
  
}