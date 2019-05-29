int sz=50;  //描く数
RandomWalk rw[]=new RandomWalk[sz];

class RandomWalk {
  PVector now;  //円の現在の位置
  PVector dir[]=new PVector[4];  //向かう方向を４方向分格納
  PVector diff;  //現在円が向かうべき方向
  ArrayList<PVector> prev=new ArrayList<PVector>();  //円の軌跡を格納
  int changeDir;  //方向を変えるフレーム間隔

  RandomWalk() {
    now=new PVector((int)random(width), (int)random(height));
    dir[0]=new PVector(1, 0);
    dir[1]=new PVector(-1, 0);
    dir[2]=new PVector(0, 1);
    dir[3]=new PVector(0, -1);
    int x=(int)random(4);
    diff=dir[x];
    changeDir=(int)random(30,50);
  }

  void move() {
    if (frameCount%changeDir==0) {
      //もし画面外にいたなら、引き戻す方向に設定
      if (now.x<0)diff=dir[0];
      else if (now.x>width)diff=dir[1];
      else if (now.y<0)diff=dir[2];
      else if (now.y>height)diff=dir[3];
      else {
        //画面内ならランダムに
        int x=(int)random(0, 4);
        diff=dir[x];
      }
    }
    prev.add(new PVector(now.x,now.y));  //prev配列の一番後ろに今の座標を入れる
    now.add(diff);  //今の座標を更新
    fill(255);
    ellipse(now.x, now.y, 10, 10);
    while (prev.size()>100)prev.remove(0);  //前100フレーム分持ちたいので、多すぎる分古いもの(前)から削除
    stroke(255);
    for (int i=1; i<prev.size(); i++) {
      line(prev.get(i).x, prev.get(i).y,prev.get(i-1).x,prev.get(i-1).y);  //軌跡を描画
    }
  }
};

void setup(){
  size(500,500,P2D); 
  smooth();
  for(int i=0;i<sz;i++)rw[i]=new RandomWalk();
}

void draw(){
  background(0);
  for(int i=0;i<sz;i++)rw[i].move(); 
}