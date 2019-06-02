int n=70;
float leng;
float eps=0;
void setup(){
  size(500,500);
  leng=width/n;
}

void draw(){
  background(0);
  translate(0,height/2);
   for(int i=0;i<n;i++){
     float y=(height/2-20)*sin((map((i+eps),0,n,0,2*PI)));
     //println(y,height/2-20,sin((map(i%(n),0,n,0,2*PI))));
     rect(i*leng,0,leng-1,-y);
   }
   eps+=0.04;
  
}