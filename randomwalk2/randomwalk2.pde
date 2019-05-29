RandomWalk2 rw_color[]=new RandomWalk2[100];
RandomWalk2 rw_white[]=new RandomWalk2[200];

class RandomWalk2 {
  PVector now;
  PVector dir[]=new PVector[4];
  PVector diff;
  ArrayList<PVector> prev=new ArrayList<PVector>();
  int changeDir;
  float c;
  float radius=250;
  int mode=0; //0なら円内部の色付き、１なら円外部の白
  RandomWalk2(int emode) {
    mode=emode;
    if (mode==0)now=new PVector(0, 0);
    else now=new PVector(random(width)-width/2, random(height)-height/2);
    dir[0]=new PVector(1, 1);  //方向ベクトルたち
    dir[1]=new PVector(-1, -1);
    dir[2]=new PVector(1, -1);
    dir[3]=new PVector(-1, 1);
    diff=new PVector(1, 1);
    changeDir=(int)random(30, 50);
    c=random(360);
  }

  void move() {
    if (mode==0) {
      if (dist(0, 0, now.x, now.y)>radius) { //色つきのが円の外に出ない
        if (now.x<0&&now.y<0)diff=dir[0];
        if (now.x>0&&now.y>0)diff=dir[1];
        if (now.x<0&&now.y>0)diff=dir[2];
        if (now.x>0&&now.y<0)diff=dir[3];
      }
    } else {
      if (dist(0, 0, now.x, now.y)<radius) { //白いのが円の中に入らない
        if (now.x>0&&now.y>0)diff=dir[0];
        if (now.x<0&&now.y<0)diff=dir[1];
        if (now.x>0&&now.y<0)diff=dir[2];
        if (now.x<0&&now.y>0)diff=dir[3];
      }
      if (now.x<-width/2)diff=dir[0];//白が画面の外に出ない
      if (now.x>width/2)diff=dir[1];
      if (now.y<-height/2)diff=dir[3];
      if (now.y>height/2)diff=dir[2];
    }

    if (frameCount%changeDir==0) { //フレームごとでの方向変更
      int x=(int)random(0, 4);
      diff=dir[x];
    }
    prev.add(new PVector(now.x, now.y));
    while (prev.size()>100)prev.remove(0);
    now.add(diff);
    if (mode==0) {    //円の色
      colorMode(HSB,360,100,100,100);
      fill(c, 100, 100,100);
    } else {
      colorMode(RGB);
      fill(255);
    }
    noStroke();
    ellipse(now.x, now.y, 10, 10); //円の描画
    
    colorMode(HSB);
    if (mode==0) {  //線の色
      colorMode(HSB);
      stroke(c, 100, 100, 100);
    } else {
      colorMode(RGB);
      stroke(255);
    }
    for (int i=1; i<prev.size(); i++) {  //線を描く
      if (i%5==0||i%5==1||i%5==2)line(prev.get(i).x, prev.get(i).y, prev.get(i-1).x, prev.get(i-1).y);
    }
  }
};

void setup() {
  size(600,600,P2D);
  for (int i=0; i<rw_color.length; i++)rw_color[i]=new RandomWalk2(0);
  for (int i=0; i<rw_white.length; i++)rw_white[i]=new RandomWalk2(1);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  noFill();
  ellipse(0, 0, 500, 500);
  for (int i=0; i<rw_color.length; i++)rw_color[i].move();
  for (int i=0; i<rw_white.length; i++)rw_white[i].move();
}