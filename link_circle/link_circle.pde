class Indicies{
 int x,y;
 Indicies(int x,int y){
  this.x=x;
  this.y=y;
 }
}

class Circle{
  float x,y,r,size,dir,nowx,nowy;
  Circle(float x,float y,float r,float size,float dir){
   this.x=x;
   this.y=y;
   this.r=r;
   this.dir=dir;
   this.size=size;
  }
  
  void update(){
    pushMatrix();
    translate(x,y);
    float rad=dir*radians(frameCount);
    float elx=size*cos(rad);
    float ely=size*sin(rad);
    ellipse(elx,ely,r,r);
    nowx=x+elx;
    nowy=y+ely;
    popMatrix();
  }
};

Circle c[][]=new Circle[4][4];

void setup(){
  size(500,500);
  noFill();
  stroke(255);
  for(int i=0;i<4;i++){
     c[0][i]=new Circle(180*cos(radians(360.0/4*i)),180*sin(radians(360.0/4*i)),20,50,1); 
     c[1][i]=new Circle(150*cos(radians(360.0/4*i)),150*sin(radians(360.0/4*i)),20,50,-1);
     c[2][i]=new Circle(120*cos(radians(360.0/4*i)),120*sin(radians(360.0/4*i)),20,50,1);
     c[3][i]=new Circle(90*cos(radians(360.0/4*i)),90*sin(radians(360.0/4*i)),20,50,-1);
  }
  
}

void draw(){
  background(0);
  translate(width/2,height/2);
  for(int i=0;i<4;i++){
   c[0][i].update();
   c[1][i].update();
   c[2][i].update();
   c[3][i].update();
  }
  
  for(int i=0;i<4;i++){
   for(int j=0;j<4;j++){
    for(int p=0;p<4;p++){
     for(int q=0;q<4;q++){
       if(i==p && j==q)continue;
       if((c[i][j].nowx-c[p][q].nowx)*(c[i][j].nowx-c[p][q].nowx)+(c[i][j].nowy-c[p][q].nowy)*(c[i][j].nowy-c[p][q].nowy)<16000){
        line(c[i][j].nowx,c[i][j].nowy,c[p][q].nowx,c[p][q].nowy); 
       }
     }
    }
   }
  }
  
}