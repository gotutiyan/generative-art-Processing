#include "ofApp.h"
#include <vector>
#include <utility>
#include <algorithm>
#define rep(i,j,k) for(int i=j;i<k;i++)

int num=30; //並べる円の個数
class Pic{
public:
    float div=60,r; //divは何個点を打つか
    vector<pair<float,float>> v; //点の情報(x,y)をペア(first,second)で格納
    vector<float> noiseSeed;
    //初期化関数
    void init(float r0){
        rep(i,0,div)noiseSeed.push_back(ofRandom(0,1000));
        r=r0;
        rep(i,0,div)v.push_back(pair<float,float>(0,0));
    }
    
    void move(){
        rep(i,0,div){
            noiseSeed[i]+=0.01;
            //ラジアンをノイズでずらすことで、打った点をずらす
            v[i].first=r*cos(DEG_TO_RAD*(i*(360/div)+ofMap(ofNoise(noiseSeed[i]),0,1,0,30)));
            v[i].second=r*sin(DEG_TO_RAD*(i*(360/div)+ofMap(ofNoise(noiseSeed[i]),0,1,0,30)));
        }
    }
};
vector<Pic> pic(num);

void ofApp::setup(){
    ofSetRectMode(OF_RECTMODE_CENTER);
    ofSetFrameRate(60);
    ofSetBackgroundColor(0);
    ofSetColor(255);
    ofSetCircleResolution(64);
    ofNoFill();
    
    rep(i,0,num)pic[i].init(i*(250.0/num));
}

void ofApp::update(){
    
}

void ofApp::draw(){
    ofTranslate(ofGetWidth()/2,ofGetHeight()/2);
    rep(i,0,num){
        pic[i].move();
        ofColor c;
        c.setHsb(i*(255.0/num),255,255);
        ofSetColor(c);
        if(i){
            rep(j,0,pic[i].v.size()){
                //隣同士の円の各点について線を引く
                ofDrawLine(pic[i-1].v[j].first,pic[i-1].v[j].second,pic[i].v[j].first,pic[i].v[j].second);
            }
        }
    }
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
