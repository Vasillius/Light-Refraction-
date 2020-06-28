class emitter {
  PVector pos;
  ArrayList<ray> rays;
  int num = 180;
  int minAngle = -45;
  int maxAngle = 45;



  emitter(float x, float y) {
    pos  = new PVector(x, y);
    rays = new ArrayList<ray>();
    int h = 180 / num;
    for (int i = minAngle; i <= maxAngle; i += h) {
      ray r = new ray(this.pos, radians(i));
      rays.add(r);
    }

    //println(rays.size());
  }



  void show() {

    for (ray r : rays) {
      r.interact();
      r.show();
    }
  }
}
