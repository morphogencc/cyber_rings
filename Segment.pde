class Segment {
  PVector origin;
  float radius;
  float thickness;
  float angle;
  int numSegments = 100;
  
  Segment(PVector _o, float _r, float _t, float _a) {
    origin = _o;
    radius = _r;
    thickness = _t;
    angle = _a;
  }
  
  void display() {
    beginShape();
    //initial point
    vertex(origin.x + radius*cos(0), origin.y + radius*sin(0));
    //extend to outer diameter, curve to angle
    for(int i = 0; i < numSegments; i++) {
          vertex(origin.x + (radius+thickness)*cos(i*angle/numSegments), origin.y + (radius+thickness)*sin(i*angle/numSegments));
    } 
    
   vertex(origin.x + (radius+thickness)*cos(angle), origin.y + (radius+thickness)*sin(angle));
    
    //inner diameter
    for(int i = numSegments; i > 0; i--) {
          vertex(origin.x + radius*cos(i*angle/numSegments), origin.y + radius*sin(i*angle/numSegments));
    }
    
    vertex(origin.x + radius*cos(0), origin.y + radius*sin(0));
    
    endShape();
  }
  
  void setRadius(float r) {
    radius = r;
  }
  
}
