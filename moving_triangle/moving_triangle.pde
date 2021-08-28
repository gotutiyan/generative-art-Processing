int N=4, R=20, LAYER=17;
Particle p[] = new Particle[LAYER];
void setup(){
  size(500,500);
  background(0);
  fill(255);
  noStroke();
  for(int i=0;i<LAYER;i++){
    PVector input[] = new PVector[N];
    int afford = R + 5;
    input[0] = new PVector(50+afford*i, 50+afford*i);
    input[1] = new PVector(50+afford*i, 450-afford*i);
    input[2] = new PVector(450-afford*i, 450-afford*i);
    input[3] = new PVector(450-afford*i, 50+afford*i);
    p[i] = new Particle(input, 5*i);
  }
}

void draw(){
  fill(0, 30);
  rect(0,0,width, height);
  fill(255);
  for(int i=0;i<LAYER;i++){
    p[i].move();
  }
  
}

float sigmoid(float x){
  return 1.0/(1+exp(-x));
}

class Particle{
  PVector pos = new PVector();
  PVector points[] = new PVector[N], points_init[];
  
  int offset=2;
  int t;
  int cycle=45;
  
  Particle(PVector input[], int idx_){
    points_init = input;
    offset = idx_;
  }
  
  void init(){
    for(int i=0;i<points.length;i++){
      points[i] = new PVector(points_init[i].x, points_init[i].y);
    }
  }
  
  void move(){
    init();
    int idx = ((frameCount+offset) % (points.length * cycle)) / cycle;
    float t = sigmoid(map((frameCount+offset) % cycle, 0, cycle-1, -6, 6));
    int prev_idx = idx;
    int next_idx = (prev_idx+1 == points.length)?0:prev_idx+1;
    //println(prev_idx, next_idx, t);
    pos = points[prev_idx].mult(1.0-t).add(points[next_idx].mult(t));
    circle(pos.x, pos.y, R);
    //println(points[0].x, points[0].y);
  }
}
