class SegmentedRing extends Ring {
  SegmentedRing(PVector _o, float _r, float _t, int _n) {
    super(_o, _r, _t, _n);
    for(int i = 0; i < numSegments; i++) {
      segments.add(new Segment(_o, _r, _t, TWO_PI / (float)_n - gap));;
    }
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
