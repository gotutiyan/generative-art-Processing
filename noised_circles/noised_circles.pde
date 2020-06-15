int n = 5;
SinOnCircle soc[] = new SinOnCircle[n];

void setup(){
  size(500,500);
  for(int i=0;i<n;i++){
     soc[i] = new SinOnCircle(40.0, 10, i/2.0);
  }
}

void draw(){
  //background(0);
  fill(255, 30);
  rect(0,0,width, height);
  translate(width/2, height/2);
  for(int i=0;i<n;i++){
    soc[i].show();
  }
}

class SinOnCircle{
  float amp_value, freq, phase;
  float pos_rad = 0, amp_rad = 0;
  SinOnCircle(float amp_value_, float freq_, float phase_){
    this.amp_value = amp_value_;
    this.freq = freq_;
    this.phase = phase_;
  }
  
  void show(){
    float amp = sin(amp_rad + phase) * amp_value;
    float x = (150 + amp) * cos(pos_rad);
    float y = (150 + amp) * sin(pos_rad);
    fill(0);
    circle(x, y, 5);
    pos_rad += PI/128.0;
    amp_rad += PI/32.0;
    println(amp);
  }
}
