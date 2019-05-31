ArrayList<PVector> pos;
float leng=10;
PVector move[]=new PVector[4];
int color_seed=0;

void setup(){
  size(500,500);
  noFill();
  colorMode(HSB,360,100,100,100);
  pos=new ArrayList<PVector>();
  move[0]=new PVector(0,1);
  move[1]=new PVector(1,0);
  move[2]=new PVector(0,-1);
  move[3]=new PVector(-1,0);
  
  pos.add(new PVector(width/2-leng-1,height/2-leng-1));
}

void draw(){
  background(0);
  if(frameCount%2==0){
    int idx=int(random(0,10000))%4;
    PVector prev;
    prev=pos.get(pos.size()-1);
    if(prev.x+(leng+3)*move[idx].x>width)idx=3;
    if(prev.x+(leng+3)*move[idx].x<0)idx=1;
    if(prev.y+(leng+3)*move[idx].y>height)idx=2;
    if(prev.y+(leng+3)*move[idx].y<0)idx=0;
    pos.add(new PVector(prev.x+(leng+3)*move[idx].x,prev.y+(leng+3)*move[idx].y));
  }
  
  for(int i=0;i<pos.size();i++){
    PVector now=pos.get(i);
    fill(map(i%20,0,20,0,255),100,100);
    rect(now.x,now.y,leng,leng); 
  }
  
}