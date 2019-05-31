int n=100;
Polygon pol11[]=new Polygon[n];
class PIC11 {
  void move() {
    colorMode(HSB, 360, 100, 100);
    noFill();
    for (int i=0; i<n; i++) {
      pol11[i].move();
    }
  }
};

class Polygon {  //p角形を書きます
  float p, size1=50, size2=100;
  float c;
  float x, y;
  float seed=random(0,10000);
  Polygon(float ep, float esize1, float ec) {
    p=ep; 
    size1=esize1;
    c=ec;
  }

  void move() {
    pushMatrix();

    size2=map(noise(frameCount/100.0+seed), 0, 1, 100, width/2);
    x=size2*cos(frameCount/100.0+seed);
    y=size2*sin(frameCount/100.0+seed);
    translate(x, y);
    stroke(c, 100, 100);
    beginShape();
    for (float i=0; i<p+1; i++)vertex(size1*cos(radians(360/p*i)), size1*sin(radians(360/p*i)));
    endShape();
    
    popMatrix();
  }
}
PIC11 p12=new PIC11();

void setup(){
 size(500,500); 
 for(int i=0;i<n;i++){
  pol11[i]=new Polygon(int(random(3,10)),random(5,50),random(0,360)); 
 }
}

void draw(){
  background(0);
  translate(width/2,height/2);
  p12.move();
}