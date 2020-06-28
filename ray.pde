class ray {
  PVector pos; //pos of origin 
  float angle; //angle of origin of ray 
  ArrayList<segment> segments;
  ArrayList<segment> tempSegments;
  boolean emitted;


  ray(PVector p, float a) {
    pos      = new PVector(p.x, p.y);
    angle    = a;
    segments     = new ArrayList<segment>();
    tempSegments = new ArrayList<segment>();
    segments.add(new segment (pos, angle, 5, 1000, n1, n2));
    emitted = false;
  }


  void interact() {
    for (segment s : segments) {
      s.checkInt(allObstacles);
      s.calcInt();
      s.refract();

      if (s.intPoint.x !=0 && s.intPoint.y != 0 && s.tag == 0) {
        tempSegments.add(new segment(new PVector(s.intPoint.x, s.intPoint.y), s.angleR, 5, s.intTag, n2, n1));
        s.tag = 1;
      }
    }
    segments.addAll(tempSegments);
    tempSegments.clear();
    //println(segments.size());
    
    //this.emitted = true;
  }
  

  void show() {
    for (segment s : segments) {
      s.show();
    }
  }
}
