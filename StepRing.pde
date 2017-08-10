class StepRing extends Ring {
  float outer_radius;
  float step;
  boolean clockwise;
  
  StepRing(PVector _o, float _r, float _outer, float _t, int _n, boolean _c) {
    super(_o, _r, _t, _n);
    outer_radius = _outer;
    step = (outer_radius - radius) / float(numSegments);
    clockwise = _c;
    for(int i = 0; i < numSegments; i++) {
      Segment s = new Segment(_o, _r + i*step, _t, TWO_PI / (float)_n - gap);
      segments.add(s);
    }
  }
  
  void display() {
     println("Inner radius: " + radius + " and outer: " + outer_radius);
    println("Step: " + step);
     for (int i = 0; i < numSegments; i++) {
      Segment seg = segments.get(i);
      seg.radius += i*step;
      pushMatrix();
      translate(origin.x, origin.y);
      if(clockwise) {
        rotate(i * TWO_PI / numSegments + angleOffset);
      }
      else {
        rotate(-1.0 * i * TWO_PI / numSegments + angleOffset);
      }
      translate(-origin.x, -origin.y);
      println("Segment radius: " + seg.radius);
      seg.display();
      popMatrix();
    }
  }
}
