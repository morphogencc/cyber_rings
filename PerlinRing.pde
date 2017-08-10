class PerlinRing extends Ring {
  PerlinRing(PVector _o, float _r, float _t, int _n) {
    super(_o, _r, _t, _n);
    for(int i = 0; i < numSegments; i++) {
      Segment s = new Segment(_o, _r, _t, TWO_PI / (float)_n - gap);
      s.thickness = thickness*noise(0.3*i);
      segments.add(s);
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
