class PIC3 {
  int sz=2;
  float x[]=new float[sz], y[]=new float[sz];
  float c[]=new float[sz];
  float seedx[]=new float[sz], seedy[]=new float[sz], seedc[]=new float[sz];

  void init() {
    for (int i=0; i<sz; i++) {
      seedx[i]=random(1000);
      seedy[i]=random(1000);
      seedc[i]=random(1000);
    }
  }

  void move() {
    for (int i=0; i<sz; i++) {
      x[i]=width/2*map(noise(seedx[i]), 0, 1, -1.5, 1.5);
      y[i]=height/2*map(noise(seedy[i]), 0, 1, -1.5, 1.5);
      c[i]=map(noise(seedc[i]), 0, 1, 0, 1000);  //0から1000までとして扱う
      stroke(c[i]%255, 255, 255, 50);  //255での剰余を適用
      line(x[i], y[i], -x[i], -y[i]);
      seedx[i]+=0.01;
      seedy[i]+=0.01;
      seedc[i]+=0.01;
    }
  }
};

PIC3 p3=new PIC3();

void setup() {
  size(500, 500); 
  blendMode(ADD);
  colorMode(HSB, 360, 100, 100, 100);
  background(0);

  p3.init();
}

void draw() {
  translate(width/2, height/2);
  p3.move();
}

void mouseClicked(){
 background(0);
}