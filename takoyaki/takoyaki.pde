int n = 100;
PVector el_up[] = new PVector[n];
PVector el_down[] = new PVector[n];
PVector li[] = new PVector[n];
float li_seed[] = new float[n];
void setup(){
  size(500,500);
  for(int i=0;i<n;i++){
    el_up[i] = new PVector();
    el_down[i] = new PVector();
    li[i] = new PVector();
    el_up[i].x=250*cos(map(i,0,n,0,PI));
    el_up[i].y=250*sin(map(i,0,n,0,PI));
    el_down[i].x=250*cos(map(i,0,n,PI,2*PI));
    el_down[i].y=250*sin(map(i,0,n,PI,2*PI));
    li[i].x=250*cos(map(i,0,n,0,PI));
  }
  strokeWeight(3);
}

void draw(){
  background(0);
  fill(0);
  translate(width/2, height/2);
  for(int i=0;i<n;i++){
    if(i+1==n)continue;
    li[i].y = 50*sin(i/3.0+frameCount/64.0)+sin(frameCount/64.0)*200;
    li[i].y = min(li[i].y, el_up[i].y);
    li[i].y = max(li[i].y, el_down[i].y);
    stroke(#C99E74);
    line(el_up[i].x, el_up[i].y, li[i].x, li[i].y);
    stroke(#834200);
    line(el_down[(n-i-1)].x, el_down[(n-i-1)].y, li[i+1].x, li[i+1].y);
    stroke(0);
    ellipse(li[i].x, li[i].y,6,6);
  }
}