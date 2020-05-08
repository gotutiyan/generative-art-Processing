int n = 10;
float width_rads[] = new float[n];
float seeds[] = new float[n];
void setup(){
  size(500,500);
  for(int i=0;i<n;i++){
    width_rads[i] = random(PI/2, 3*PI/2);
    seeds[i] = random(0,100000);
  }
}

void draw(){
  background(0);
  stroke(255);
  for(int i=n-1;i>=0;i--){
    fill(255,map(i,0,n,0,50));
    float rotate_rad = map(noise(seeds[i]),0,1,0,2*PI);
    translate(width/2,height/2);
    rotate(rotate_rad);
    float r = map(i,0,n,50,width);
    PVector lower_pos = new PVector(r*cos(0)/2,r*sin(0)/2);
    PVector upper_pos = new PVector(r*cos(width_rads[i])/2, 
                                  r*sin(width_rads[i])/2);
    arc(0,0,r,r,0,width_rads[i]);
    line(0,0,lower_pos.x,lower_pos.y);
    line(0,0,upper_pos.x,upper_pos.y);
    seeds[i]+=0.01;
    resetMatrix();
  }
}
