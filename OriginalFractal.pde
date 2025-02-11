float zoom = 0;

public void setup() {
  size(800,550);
  noStroke();
  fill(0,0,0,255);
}

public void draw() {
  background(255);
  fractal(400,400+1.732*zoom,600+3*zoom);
  zoom+=5;
}

public void fractal(float x, float y, float sLength) {
  double high = sLength*Math.sin(PI/3);
  if(sLength > 3*600) {
    zoom = 0;
  }
  if(sLength > 8) {
    y -= (sLength*Math.sin(PI/3)/6);
    beginShape();
    vertex(x - sLength/2, (float)(y + sLength*Math.sin(PI/3)/2));
    vertex(x + sLength/2, (float)(y + sLength*Math.sin(PI/3)/2));
    vertex(x, (float)(y - sLength*Math.sin(PI/3)/2));
    endShape();
    y += (sLength*Math.sin(PI/3)/3);
    beginShape();
    vertex(x - sLength/2, (float)(y - sLength*Math.sin(PI/3)/2));
    vertex(x + sLength/2, (float)(y - sLength*Math.sin(PI/3)/2));
    vertex(x, (float)(y + sLength*Math.sin(PI/3)/2));
    endShape();
    y -= (sLength*Math.sin(PI/3)/6);
    
    fractal(x, y-4*(float)high/9, sLength/3);
    fractal(x + sLength/3, y-2*(float)high/9, sLength/3);
    fractal(x + sLength/3, y+2*(float)high/9, sLength/3);
    fractal(x, y+4*(float)high/9, sLength/3);
    fractal(x - sLength/3, y+2*(float)high/9, sLength/3);
    fractal(x - sLength/3, y-2*(float)high/9, sLength/3);
  }
}


