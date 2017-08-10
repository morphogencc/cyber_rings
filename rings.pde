ArrayList<Ring> s;
PVector origin;
float hue, sat;
int count;

void setup() {
  size(6000, 4500, P2D);
  frameRate(60);
  background(0);
  smooth();
  noStroke();
  colorMode(HSB, TWO_PI, 1.0, 1.0);
  origin = new PVector(width/2, height/2);
  ellipse(origin.x, origin.y, 10, 10);
  s = new ArrayList<Ring>();
  newRings();
  for (int i = 0; i < s.size(); i++) {
    Ring ring = s.get(i);
    ring.display();
  }
  hue = random(TWO_PI);
  sat = random(0.5, 1.0);
  count = 0;
}

void draw() {
  if (count % 6000 == 0) {
        newRings();
  }
   background(0);
    for (int i = 0; i < s.size(); i++) {
      Ring ring = s.get(i);
      fill(ring.hue, ring.saturation, 1.0, ring.alpha);
      ring.angleOffset += ring.dAngleOffset;
      ring.radius = ring.radius_original + ring.dRadius * sin(frameCount / ring.frequency);
      ring.setRadius(ring.radius);
      ring.display();
    }
  count++;
}

void newRings() {
  s.clear();

  hue = random(TWO_PI);

  int numSegs = int(random(0,7));
  int numWedges = int(random(0,4));
  int numAzi = int(random(0,4));
  int numStep = int(random(0,2));

  for (int i = 0; i < numSegs; i++) {
    s.add(new SegmentedRing(origin, random(0, height/2.2), random(25, 50), int(random(0, 20))));
  }
  for (int i = 0; i < numWedges; i++) {
    s.add(new WedgeRing(origin, random(50, height/8), random(height/4, height/3), random(TWO_PI/12.0)));
  }
  for (int i = 0; i < numAzi; i++) {
    s.add(new AzimuthalRing(origin, random(50, height/2.15), random(5, 25), random(TWO_PI/3, TWO_PI)));
  }
  for (int i = 0; i < numStep; i++) {
    s.add(new StepRing(origin, random(50, height/3), random(height/4, height/2), random(5, 25), int(8*random(1.0)), random(1) < 0.5));
  }

  for (int i = 0; i < s.size(); i++) {
    Ring ring = s.get(i);
    ring.hue = hue;
    ring.saturation = 1;
    ring.dAngleOffset = random(-0.005, 0.005);
    ring.frequency = random(30, 360);
    ring.dRadius = random(0,250);
  }
}

void keyPressed() {
  if (key == 'r') {
    newRings();
  }

  if (key == ' ') {
    saveFrame(frameCount + ".png");
  }
}
