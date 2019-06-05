class Particle{
  float size;
  float deg=0,add_deg;
  PVector pos=new PVector();
  float noise_seed;
  Particle(float size){
   this.size=size;
   deg=radians(random(360));
   add_deg=radians(random(0.1,2.0));
   noise_seed=random(10000);
  }
  
  void show(){
   float noi=map(noise(noise_seed),0,1,-20,20);
   pos.x=(size+noi)*cos(deg); 
   pos.y=(size+noi)*sin(deg);
   deg+=add_deg;
   noise_seed+=0.01;
  }
}

int N=100;
Particle p[]=new Particle[N];

void setup(){
  size(500,500);
  colorMode(HSB,360,100,100);
  stroke(255);
  for(int i=0;i<N;i++){
    if(i<N/2)p[i]=new Particle(120);
    else p[i]=new Particle(200);
  }
}

void draw(){
  colorMode(RGB);
  background(0);
  colorMode(HSB,360,100,100);
  translate(width/2,height/2);
  for(int i=0;i<N;i++){
   p[i].show(); 
  }
  for(int i=0;i<N;i++){
   for(int j=i+1;j<N;j++){
    if(p[i].pos.dist(p[j].pos)<80){
      stroke(map(p[i].pos.dist(p[j].pos),0,80,50,200),100,100);
      line(p[i].pos.x,p[i].pos.y,p[j].pos.x,p[j].pos.y); 
    }
   }
  }
  
}