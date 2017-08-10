class ResegmentedRing extends Ring {
  float partitions;
  
  ResegmentedRing(PVector _o, float _r, float _t, int _n) {
    super(_o, _r, _t, _n);
    partitions = random(1.0, 6.0);
    for(int i = 0; i < numSegments; i++) {  
      segments.add(new Segment(_o, _r, _t, TWO_PI / ((float)_n*partitions)));;
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
