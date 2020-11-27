float rand[] = new float[8];
float moved[] = new float[8];
int FRAME_UNIT=120;
void setup(){
  size(500,500);
  for(int i=0;i<rand.length;i++){
    rand[i] = int(random(-4,4));
    rand[i] = rand[i]*TAU/12;
    moved[i] = 0;
  }
}

void draw(){
  background(0);
  fill(255);
  art2();
}
void art2(){
  translate(width/2, height/2);
  for(int i=0;i<8;i++){
    for(int j=0;j<12;j++){
      float rad = map(j,0,11,0,2*PI-PI/6);
      //float add_rad = PI/6*sin(radians(frameCount*6 + i*20));
      float add_rad = PI/6*sin(map(noise(frameCount/64. + i*0.1), 0, 1, 0, PI));
      float r = map(i,0,7,0,width/2-50)+40;
      circle(r*cos(rad+add_rad), r*sin(rad+add_rad), 20);
    }
  }
  setup();
}
