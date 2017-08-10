class WedgeRing extends Ring {
  WedgeRing(PVector _o, float _r, float _t, float _a) {
    super(_o, _r, _t, 1);
    segments.add(new Segment(_o, _r, _t, _a));
  }
  
  void display() {
    for (int i = 0; i < numSegments; i++) {
      Segment seg = segments.get(i);
      pushMatrix();
      translate(origin.x, origin.y);
      rotate(i * TWO_PI / numSegments + angleOffset);
      translate(-origin.x, -origin.y);
      seg.display();
      popMatrix();
    }
  }
}
