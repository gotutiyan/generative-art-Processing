int n = 10, side_leng;
void setup(){
  size(500,500);
  side_leng = width / n;
  noStroke();
}
void draw(){
  background(0);
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      float noi = noise((i+j+frameCount)/10.0);
      float len = map(noi, 0, 1, 0, side_leng);
      rect(i*side_leng + side_leng/4, j*side_leng + side_leng/4, len, len);
    }
  }
}