int n=5;
PVector rettou = new PVector(3,3);
void setup(){
  size(500,500);
}

void draw(){
  background(0);
  for(int i=0;i<n;i++)for(int j=0;j<n;j++){
    int sz = width/n;
    if(frameCount%180<90) aste_to_lissa(new PVector(sz/2+sz*i, sz/2+sz*j), (rettou.x==i&&rettou.y==j), (i+j)*10);
    else if(frameCount%180>=90) aste_to_lissa(new PVector(sz/2+sz*i, sz/2+sz*j), !(rettou.x==i&&rettou.y==j), (i+j)*10);
  }
}

void aste_to_lissa(PVector pos, boolean reverse, int offset){
  int cycle_time = 90;
  int now = (frameCount)%cycle_time;
  float rate1, rate2;
  if(reverse){
    rate2 = (now)/float(cycle_time);
    rate1 = (cycle_time-now)/float(cycle_time);
  }else{
    rate1 = (now)/float(cycle_time);
    rate2 = (cycle_time-now)/float(cycle_time);
  }
  if(pos.x==50)println(rate1, rate2);
  translate(pos.x, pos.y);
  for(float rad=0;rad<2*PI;rad+=PI/32){
    PVector draw_pos = _circle(rad,width/n/2).mult(rate1).add(asteroid(rad, width/n/2).mult(rate2));
    ellipse(draw_pos.x, draw_pos.y, 5, 5);  
  }
  resetMatrix();
}

PVector asteroid(float rad, float radius){
  return new PVector(radius*cos(rad)*cos(rad)*cos(rad),
                     radius*sin(rad)*sin(rad)*sin(rad));
}

PVector lissajous(float rad, float radius){
  return new PVector(radius*sin(3*rad), radius*sin(4*rad));
}

PVector _circle(float rad, float radius){
  return new PVector(radius*cos(rad), 
                     radius*sin(rad));
}
