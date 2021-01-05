int N = 20, FRAME_UNIT=50;
float rad;
void setup(){
  size(500,500);
  rad = 2*PI/N;
  noFill();
  stroke(255);
  strokeWeight(5);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(int i=0;i<N;i++){
    float sig_x = map((frameCount+5*i)%FRAME_UNIT, 0, FRAME_UNIT-1, -20, 20);
    int mode = (frameCount+5*i)%(2*FRAME_UNIT) < FRAME_UNIT?1:0;
    float r = map(sigmoid(sig_x), 0, 1, mode*80, 80-mode*80);
    float base_x = r*cos(i*rad+rad/2);
    float base_y = r*sin(i*rad+rad/2);
    arc(base_x, base_y, 200, 200, i*rad, (i+1)*rad); 
    line(base_x, base_y, base_x+100*cos(i*rad), base_y+100*sin(i*rad));
    line(base_x, base_y, base_x+100*cos((i+1)*rad), base_y+100*sin((i+1)*rad));
  }
}

float sigmoid(float x){
  return 1/(1+pow(2.718, -x));
}
