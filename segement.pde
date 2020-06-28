class segment {
  PVector pos; //pos of origin
  PVector intPoint;
  PVector checkPoint;
  float angle;
  float lngth;
  float record; // shortest intersection dist
  float angleI; //angle of incidence 
  float angleR; //angle of refraction wich it should pass to the next refrated segment 
  int tag; //to track whether a segemnt has refracted or not 
  int orgTag; //origin tag
  int intTag; //intersection tag 
  float m1, m2;



  segment(PVector p, float a, float l, int ot, float ma, float mb) {
    pos = new PVector(p.x, p.y);
    intPoint = new PVector();
    //checkPoint = new PVector();
    angle = a;
    lngth = l;
    record = 999999999;
    tag = 0;
    orgTag = ot;
    m1 = ma;
    m2 = mb;
  }



  void show() {

    if (intPoint.x !=0 && intPoint.y !=0 ) {
      stroke(255);
      line(pos.x, pos.y, intPoint.x, intPoint.y);
      //ellipse(intPoint.x, intPoint.y, 10, 10);
    }
  }




  void checkInt(ArrayList<obstacle> obstacles) {
    float x3 = pos.x;
    float y3 = pos.y;
    float x4 = pos.x + lngth * sin(angle); 
    float y4 = pos.y + lngth * cos(angle);

    for (int i = 0; i < obstacles.size(); i++) {
      obstacle ob = obstacles.get(i); 
      if (ob.tag != orgTag) {
        float x1 = ob.pos1.x;
        float y1 = ob.pos1.y;
        float x2 = ob.pos2.x;
        float y2 = ob.pos2.y;

        float den = (x1 - x2)*(y3 - y4)-(y1 - y2)*(x3 - x4);// common denominator 
        //if (den == 0) {
        //  return;
        //}
        float t = ((x1 - x3)*(y3 - y4) - (y1 - y3)*(x3 - x4)) / den;
        float u = -((x1 - x2)*(y1 - y3) - (y1 - y2)*(x1 - x3)) / den;

        if ( t > 0 && t < 1 && u > 0) { // if there is an intersection 
          checkPoint = new PVector (x1 + t*(x2 - x1), y1 + t * (y2 - y1));// calculate intersetion point
          float d = dist(pos.x, pos.y, checkPoint.x, checkPoint.y); //calculate distance to intersection 
          if (d < record ) {
            record = d;
            intPoint = checkPoint;
            intTag = ob.tag;
          } else {
          }
        }
      }
    }
  }



  void calcInt() {

    float mR = (intPoint.y - pos.y) / (intPoint.x - pos.x);   //slope of ray 
    float angleV = atan(mR - 0.000001 / 1 + mR * 0.000001); // get ray angle relative to normal with an undefined slope 
    float angleS = angleV / abs(angleV); //get the sign of angle relative to normal 
    angleI = angleS * (PI/2 - abs(angleV));
    //println(degrees(angleI));
  }


  void refract() {

    float a = (m1/m2) * sin(angleI); 
    angleR = asin(a);
    //println(degrees(angleX));
    stroke(0, 255, 0);
    if (intPoint.x != 0 && intPoint.y != 0) {
      //line(intPoint.x, intPoint.y, intPoint.x + 100 * sin(angleR), intPoint.y + 100 * cos(angleR));
    }
  }
}
