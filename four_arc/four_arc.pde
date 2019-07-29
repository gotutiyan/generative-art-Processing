//Arc a=new Arc(new PVector(100, 100), new PVector(40, 40), 0);
Arc[][] a=new Arc[5][5];

void setup() {
  size(500, 500);
  fill(255);
  for(int i=0;i<5;i++){
    for(int j=0;j<5;j++){
      a[i][j]=new Arc(new PVector(50+100*i, 50+100*j), new PVector(100,100));
    }
  }
}

void draw() {
  background(0);
  for(int i=0;i<5;i++){
    for(int j=0;j<5;j++){
      a[i][j].show();
    }
  }
  
}

class Arc {
  PVector pos;
  PVector size;
  float start; //radians
  float[] noiseSeed_s=new float[4], noiseSeed_e=new float[4];

  Arc(PVector pos_, PVector size_) {
    pos=pos_;
    size=size_;
    for (int i=0; i<4; i++) {
      noiseSeed_s[i]=random(100000);
      noiseSeed_e[i]=random(100000);
    }
  }
  void show() {
    for (int i=0; i<4; i++) {
      if(i==3) fill(#32CEC0);
      else if(i==1) fill(#70F231);
      else fill(#F5E1C8);
      float s=map(noise(noiseSeed_s[i]), 0, 1, 0, 45)+90*(i-1);
      float e=-map(noise(noiseSeed_e[i]), 0, 1, 0, 45)+90*i;
      arc(pos.x, pos.y, size.x, size.y, radians(s), radians(e));
      noiseSeed_s[i]+=0.01;
      noiseSeed_e[i]+=0.01;
    }
  }
}