int deep_limit = 5;
void setup(){
  size(500,500);
  noFill();
  stroke(255);
  rectMode(CENTER);
  colorMode(HSB,360,255,255);
}

void draw(){
  background(0);
  rec(new PVector(width/2,height/2), 200.0, 0);
}

void rec(PVector pos, float sz, int deep){
  if(deep==deep_limit)return;
  //stroke(map(deep, 0, deep_limit-1, 0,360), 50, 255);
  strokeWeight(map(deep, 0, deep_limit-1, 5, 1));
  float rad = frameCount * PI/60.0 * float(deep+1)/(deep_limit+1);
  translate(pos.x, pos.y);
  rotate(rad);
  rect(0, 0, sz, sz);
  resetMatrix();
  rec(new PVector(pos.x-sz/2, pos.y-sz/2), sz/2, deep+1);
  rec(new PVector(pos.x-sz/2, pos.y+sz/2), sz/2, deep+1);
  rec(new PVector(pos.x+sz/2, pos.y-sz/2), sz/2, deep+1);
  rec(new PVector(pos.x+sz/2, pos.y+sz/2), sz/2, deep+1);
  return;
}
