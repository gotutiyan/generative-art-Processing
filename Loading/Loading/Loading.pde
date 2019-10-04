void setup(){
 size(500,500);
 fill(0);
 textSize(50);
}
float seed=0;
void draw(){
  background(255);
  String s="Loading";
  char c[]=s.toCharArray();
  for(int i=0;i<c.length;i++){
    float t=max(0,100*sin(seed+i*0.5));
    text(c[i],width/c.length*(0.8*(i+1)),height/2-t);
  }
  seed+=0.1;
}