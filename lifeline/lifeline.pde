Line line[] = new Line[4];
void setup(){
  size(500,500);
  for(int i=0;i<4;i++)line[i]=new Line(width-100);
}

void draw(){
  background(0);
  translate(50,50);
  line[0].move();
  resetMatrix();
  translate(50, 450);
  line[1].move();
  resetMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  translate(-width/2+50,-height/2+49);
  line[2].move();
  resetMatrix();
  translate(width/2, height/2);
  rotate(PI/2);
  translate(-width/2+50,-height/2+width-49);
  line[3].move();
  
  
}


class Line{
  PVector pos;
  PVector range = new PVector(random(0,100), random(100,200));
  float noise_seed = random(0,1000);
  float leng = 0;
  float noise_leng = random(100,200);
  Line(float leng){
    this.leng=leng;
  }
  
  // direction: -1 or 1
  void move(int direction){
    float noise_start_pos = leng/2-noise_leng/2+(leng/2+noise_leng/2)*sin(frameCount/30.0);/*(5*frameCount)%leng);*/
    float noise_end_pos = min(leng, noise_start_pos + noise_leng);
    for(int x=0;x<leng;x++){
      float y = 0;
      if(noise_start_pos <=x && x <= noise_end_pos){
        y = 50*noise(noise_seed+x*0.01);
      }
      stroke(255);
      y*=direction;
      point(max(0,x),y);
      line(max(0,noise_start_pos-1),0,max(0,noise_start_pos),y);
      line(noise_end_pos+1,0,noise_end_pos,y);
      noise_seed += 0.01;
    }
  }
}
