int n = 20;
Box box[][] = new Box[n][n];
void setup(){
  size(500,500);
  rectMode(CENTER);
  int len = height / n;
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      box[i][j] = new Box(new PVector(i*len, j*len),
                          len,
                          (i%4<2 && j%4<2 || i%4>=2 && j%4>=2)?0:255,
                          (i+j)%2==0);
    }
  }
}

void draw(){
  background(0);
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      box[i][j].move();
    }
  }
}

class Box{
  PVector pos;
  int len;
  color base_color;
  boolean is_color_change;
  Box(PVector pos_, int len_, int base_color_, boolean is_color_change_){
    pos = pos_;
    len = len_;
    base_color = base_color_;
    is_color_change = is_color_change_;
  }
  void move(){
    int cycle = 120;
    if(is_color_change){
      float sin_rad = map(frameCount%cycle, 0, cycle-1, 0, 2*PI);
      fill(abs(255*map(sin(sin_rad), -1, 1, 0, 1) - base_color));
    }else{
      fill(base_color);
    }
    translate(pos.x+len/2, pos.y+len/2);
    rect(0, 0, len, len);
    resetMatrix();
  }
}

/*
ooxx
ooxx
xxoo
xxoo

xoox
oxxo
oxxo
xoox
*/
