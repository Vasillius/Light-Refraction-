class obstacle{
  
  PVector pos1;
  PVector pos2;
  int tag;
  
  obstacle(float x1, float y1, float x2, float y2 , int t){
    pos1 = new PVector (x1, y1);
    pos2 = new PVector (x2, y2);
    tag = t;
  }
  
    
  void show(){
    stroke(255);
    line(pos1.x,pos1.y,pos2.x,pos2.y);
  }

}
