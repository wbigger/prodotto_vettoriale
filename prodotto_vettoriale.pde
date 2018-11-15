PShape a;
PShape b;
PShape p;

int circleDiameter = 500;
float alpha;

PShape createArrow() {
  PShape ret = createShape(); 
  ret.beginShape();
  ret.vertex(0, 0);
  ret.vertex(circleDiameter/2.0, 0);
  ret.vertex(circleDiameter/2.0*0.95, circleDiameter*0.05);
  ret.vertex(circleDiameter/2.0*0.95, -circleDiameter*0.05);
  ret.vertex(circleDiameter/2.0, 0);
  ret.endShape();
  ret.setStrokeWeight(4);
  return ret;
}

void setup() {
  size(600, 600, P3D);
  a = createArrow();
  a.setStroke(#0000FF);
  b = createArrow();
  b.setStroke(#FF0000);
  p = createArrow();
  p.setStroke(#A0A0A0);
  p.rotateY(PI/2.0);
}

void draw() {
  background(#FFFFFF);
  
  alpha = (float)mouseX/width*2.0*PI;
  float product = (circleDiameter*circleDiameter*sin(alpha))/circleDiameter;
  
  // draw text
  fill(0);
  textSize(30);
  text("alpha: "+str(round(alpha/(2*PI)*360))+" gradi", 50, 60);
  text("product: "+str(round(product)), 50, 100);
  
  // Put on the center of the screen
  translate(width/2, height/2);
  // reduce size a bit
  scale(0.5);
  // rotate around X axis to give 3D effect
  rotateX(PI/4);

  // draw ellipse
  noFill();
  stroke(0);
  strokeWeight(4);
  ellipse(0, 0, circleDiameter, circleDiameter);

  // draw arrows
  shape(b);
  
  pushMatrix();
  rotate(-alpha);
  shape(a);
  popMatrix();
  
  
  pushMatrix();
  scale(0,0,product/circleDiameter);
  shape(p);
  popMatrix();
  
}
