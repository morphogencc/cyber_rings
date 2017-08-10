class AzimuthalRing extends Ring {
  boolean smallSegment;
  
  AzimuthalRing(PVector _o, float _r, float _t, float _a) {
    super(_o, _r, _t, 1);
    segments.add(new Segment(_o, _r, _t, _a - gap));
  }
  
  void display() {
    for (int i = 0; i < segments.size(); i++) {
      Segment seg = segments.get(i);
      pushMatrix();
      translate(origin.x, origin.y);
      rotate(angleOffset);
      translate(-origin.x, -origin.y);
      seg.display();
      popMatrix();
    }
  }
}
