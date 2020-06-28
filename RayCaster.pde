ArrayList<obstacle> allObstacles;
ArrayList<ray> rrays;
emitter e;

float mX, mY;
float n1 = 1.000293; //air 
float n2 = 1.333; //water 

void setup() {
  size(500, 500);
  allObstacles = new ArrayList<obstacle>();
  rrays        = new ArrayList<ray>();
  obstacle o1  = new obstacle(0, 150, width, 150, 1);
  allObstacles.add(o1);
  obstacle ot  = new obstacle(0, 180, width, 180, 2);
  allObstacles.add(ot);
  //obstacle o  = new obstacle(0, 300, width, 300, 3);
  //allObstacles.add(o);
  //obstacle ox  = new obstacle(0, 400, width, 400, 4);
  //allObstacles.add(ox);
  obstacle o2  = new obstacle(0, 0, width, 0, 0);
  allObstacles.add(o2);
  obstacle o3  = new obstacle(0, 0, 0, height, 0);
  allObstacles.add(o3);
  obstacle o4  = new obstacle(width, 0, width, height, 0);
  allObstacles.add(o4);
  obstacle o5  = new obstacle(0, height, width, height, 0);
  allObstacles.add(o5);

  e = new emitter ((width / 2), height / 4);
}



void draw() {
  background(0);
  fill(255);
  for (obstacle o : allObstacles) {
    o.show();
  }

  e.show();
}
