class PIC8 {
  int sz=50;
  float seed[]=new float[sz];
  PIC8() {
    for (int i=0; i<sz; i++)seed[i]=random(1000);
  }

  void move() {
    colorMode(HSB,360,100,100,100);
    translate(width/2, height/2);
    for (int i=0; i<sz; i++) {
      float leng=map(noise(seed[i]), 0, 1, 0, 70);
      float x=(200+leng)*cos(radians(i*(360.0/sz)));
      float y=(200+leng)*sin(radians(i*(360.0/sz)));
      stroke(map(i, 0, sz, 0, 360), 100, 100, 100);
      line(x/2, y/2, x, y);
      ellipse(x, y, 5, 5);
      ellipse(x/2, y/2, 5, 5);
      seed[i]+=0.01;
    }
  }
}
PIC8 p8=new PIC8();

void setup(){
  size(500,500);
}

void draw(){
 background(0);
 p8.move();
}