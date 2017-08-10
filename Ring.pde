abstract class Ring {
  PVector origin;
  float radius;
  float radius_original;
  float thickness;
  int numSegments;
  ArrayList<Segment> segments;
  float gap;
  float hue;
  float saturation;
  float alpha;
  float angleOffset;
  float dAngleOffset;
  float dRadius;
  float frequency;
 
  Ring(PVector _o, float _r, float _t, int _n) {
    origin = _o;
    radius = _r;
    radius_original = _r;
    thickness = _t;
    numSegments = _n;
    gap = TWO_PI / numSegments * 0.1;
    //gap = TWO_PI / 100.0;
    angleOffset = random(TWO_PI);
    segments = new ArrayList<Segment>();
    alpha = 255;
  }
  
  abstract void display();
  
  void setRadius(float r) {
     for (int i = 0; i < numSegments; i++) {
      Segment seg = segments.get(i);
      seg.setRadius(r);
     }
  }
}

/*
other ring styles to add:
- circles?
- trapezoids?
- re-segmented rings?
*/
