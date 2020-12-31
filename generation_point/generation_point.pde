int N = 10, FRAME_UNIT=60;
int len_lim;
void setup(){
  size(500,500);
  rectMode(CENTER);
  noFill();
  stroke(255);
  strokeWeight(5);
  textSize(20);
  len_lim = width/N - 15;
}

void draw(){
  background(0);
  for(int i=0;i<10;i++){
    for(int j=0;j<10;j++){
      int mode = int((frameCount+i+j)%(2*FRAME_UNIT) >= FRAME_UNIT);
      float sig_x = map((frameCount+i+j)%FRAME_UNIT, 0, 59, -20, 20);
      float len = map(sigmoid(sig_x), 0, 1, len_lim*mode, len_lim-len_lim*mode);
      rect(25+50*i, 25+50*j, len, len);
    }
  }
}

float sigmoid(float x){
  return 1/(1+pow(2.718, -x));
}
