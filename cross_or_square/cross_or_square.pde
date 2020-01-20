int n = 10;
int side_length;
Cross cross[][] = new Cross[n][n];
Square square[][] = new Square[n+10][n+10];
void setup(){
  size(500,500);
  rectMode(CENTER);
  strokeWeight(3);
  side_length = width / n;
  for(int i=0;i<n;i++){
    for(int j=0;j<n;j++){
      cross[i][j] = new Cross(side_length/2, 
                      new PVector(side_length/2 + j*side_length, 
                        side_length/2 + i*side_length));                                    
    }
  }
  
  for(int i=0;i<n+10;i++){
    for(int j=0;j<n+10;j++){
       square[i][j] = new Square(side_length/2,
                      new PVector(-side_length/2 + j*side_length,
                        -side_length/2 + i*side_length));
    }
  }
}

void draw(){
  background(0);
  if(frameCount%180 <= 90){
    for(int i=0;i<n;i++){
      for(int j=0;j<n;j++){
        cross[i][j].move();
      }
    }
  }else {
    for(int i=0;i<n+10;i++){
       for(int j=0;j<n+10;j++){
          square[i][j].move();
       }
    }
  }
}

class Cross{
  float radius;
  PVector pos;
  Cross(float radius_, PVector pos_){
    this.radius = radius_;
    this.pos = pos_;
  }
  
  void move(){
    stroke(255);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(radians(frameCount));
    line(-radius, 0, radius, 0);
    line(0, -radius, 0, radius);
    popMatrix();
  }
}

class Square{
  float radius;
  PVector pos;
  Square(float radius_, PVector pos_){
    this.radius = radius_;
    this.pos = pos_;
  }
  
  void move(){
    pushMatrix();
    translate(pos.x-radius, pos.y-radius);
    rotate(radians(frameCount));
    stroke(255);
    fill(0);
    rect(0,0,2*radius, 2*radius);
    popMatrix();
  }
}