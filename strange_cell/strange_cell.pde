int n=10;
Cell_Line cl[][][]=new Cell_Line[2][n+1][n+1];

void setup(){
  size(500,500);
  for(int mode=0;mode<2;mode++)
    for(int i=0;i<n+1;i++)
      for(int j=0;j<n+1;j++)
        cl[mode][i][j]=new Cell_Line(width/float(n)*j, height/float(n)*i, width/float(n),mode);
}

void draw(){
  background(255);
  stroke(0);
  strokeWeight(5);
  for(int mode=0;mode<2;mode++)
    for(int i=0;i<n+1;i++)
      for(int j=0;j<n+1;j++)
        cl[mode][i][j].show();
}

class Cell_Line{
  PVector pos;
  float rad=0;
  float leng;
  int mode;
  
  Cell_Line(float _x,float _y,float _leng,int _mode){
    pos=new PVector(_x,_y);
    leng=_leng;
    mode=_mode;
  }
  
  void show(){
    if(millis()%4000<=3000){
      if(mode==0)rad=PI/3000*(millis()%4000);
      else rad=PI/3000*(millis()%4000)+PI/2;
    }else {
      if(mode==0)rad=0;
      else rad=PI/2;
    }
    if(millis()%8000<=3000){ // 0ms between 3000ms
      rad=(mode==0?PI/3000*(millis()%8000):PI/2);
    }else if(millis()%8000<=4000){ // 3000ms between 4000ms 
      rad=(mode==0?0:PI/2);
    }else if(millis()%8000<=7000){ // 4000ms between 7000ms
      rad=(mode==1?PI/3000*(millis()%8000-4000)+PI/2:0);
    }else { // 7000ms between 8000ms
      rad=(mode==0?0:PI/2);
    }
    float x=leng*cos(rad);
    float y=leng*sin(rad);
    translate(pos.x,pos.y);
    line(0,0,x,y);
    resetMatrix();
  }
}