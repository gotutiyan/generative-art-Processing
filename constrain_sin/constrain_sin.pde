float line_y[]=new float[2];
float seed[]=new float[2];
int n=100;
float siny[]=new float[n];
float sin_seed=0;
void setup(){
  size(500,500);
  for(int i=0;i<2;i++){
    line_y[i]=0;
    seed[i]=random(0,10000);
  }
  
  for(int i=0;i<n;i++)siny[i]=0;
}

void draw(){
  background(0);
  stroke(255);
  pushMatrix();
  translate(0,height/2);
  for(int i=0;i<2;i++){
    line_y[i]=map(noise(seed[i]),0,1,10,height/2-10);
    if(i==0)line_y[0]*=-1;
    line(0,line_y[i],width,line_y[i]);
  }
  for(int i=0;i<n;i++){
    float y=200*sin(2.0*PI/n*i+sin_seed);
    //println(line_y[0],y);
    if(y<0)y=max(line_y[0],y);
    else y=min(line_y[1],y);
    float x=width/float(n)*i;
    line(x,0,x,y);
  }
  popMatrix();
  
  for(int i=0;i<2;i++)seed[i]+=0.005;
  sin_seed+=0.01;
}