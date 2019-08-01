RectSplit a=new RectSplit();
void setup(){
  size(500,500);
  noStroke();
  a.init();
}

void draw(){
  background(0);
  a.show();
}

class RectSplit{
  PVector pos;
  float w,h;
  float[] barx=new float[2], bary=new float[2];
  float[] barh1=new float[2], barw1=new float[2] ,barh2=new float[2], barw2=new float[2];
  int mode=0;
  
  void init(){
    pos=new PVector(0,0);
    w=h=500;
    for(int i=0;i<2;i++){
     barh1[i]=barw2[i]=0;
     barh2[i]=barw1[i]=10;
     barx[i]=w*0.333*(i+1)-5;
     bary[i]=h*0.333*(i+1)-5;
    }
  }
  
  void show(){
    fill(#FAEDBD);
    rect(pos.x,pos.y,w,h);
    fill(#78D1FC);
    for(int i=0;i<2;i++){
      rect(barx[i],0,barw1[i],barh1[i]);
      rect(0,bary[i],barw2[i],barh2[i]);
    }
    if(mode==0){
      for(int i=0;i<2;i++){
        barw2[i]+=7;
        if(barw2[i]>=w){
         mode=1;
         break;
        }
      }
    }else if(mode==1){
      for(int i=0;i<2;i++){
        barh1[i]+=7;
        if(barh1[i]>=h){
          mode=2;
          break;
        }
      }
    }else if(mode==2){
      for(int i=0;i<2;i++){
        barw1[i]+=2;
        barh2[i]+=2;
      }
      barx[0]-=4;
      bary[0]-=4;
      barx[1]+=2;
      bary[1]+=2;
      if(barx[0]+barw1[0]<0){
        init(); 
        mode=0;
      }
    }
  }
  
}