class Sin{
  int n;
  float leng,drawY,height_limit;
  float eps,eps_add;
  
  Sin(){
    this.n=int(random(20,70));
    this.leng=width/float(this.n);
    this.drawY=int(random(height/2-100,height/2+100));
    this.height_limit=int(random(height/2- abs(height/2-drawY)));
    this.eps_add=random(0.01,0.2);
    this.eps=random(0,1000);
  }
  
  void show(){
    pushMatrix();
    translate(0,drawY);
    for(int i=0;i<n;i++){
      float y=height_limit*sin((map((i+eps),0,n,0,2*PI)));
      rect(i*leng,0,leng-1,-y);
    }
    eps+=eps_add;
    popMatrix();
  }
 
}

int N=10;
Sin s[]=new Sin[N];
void setup(){
  size(500,500);
  //blendMode(DIFFERENCE);
  for(int i=0;i<N;i++)s[i]=new Sin();
}

void draw(){
  background(0);
  for(int i=0;i<N;i++){
    s[i].show();
  }
}