class Dot {
  PVector pos;
  PVector vel;
  color c;
  color altC;
  float rotate;
  float size;
  float speed;
  boolean righting;

  Dot(int x, int y) {

    // make position vector based on x,y coordinates
    pos = new PVector(x, y);

    // pick a random color
    // take a random pretty hue
    int hue = (hues[int(random(0, hues.length-1))])%360;
    float sat = random(30, 50);
    float bri = random(90, 100);
    c = color(hue, sat, bri);
    altC = color((hue + 20) % 360, sat, bri);
    
    // pick a random size
    size = random(50, 100);

    // pick random rotation strength
    rotate = random(0.2);

    // pick a random speed or movement
    speed = random(5, 10);

    // create random velocity vector and set its speed
    vel = PVector.random2D().setMag(speed);

    // randomly chose left/right leaning
    righting = (Math.random() < 0.5);

  }

  void update() {

    // randomly change direction of rotation
    if (Math.random() < 0.01) {
      righting = !righting;
    }

    // rotate left or right based on righting
    if (righting) {
      vel.rotate(rotate);
    } else {
      vel.rotate(-rotate);
    }

    // add the velocity to the vector
    pos.add(vel);

  }

  void render() {
    fill(c);
    ellipse(pos.x, pos.y, size, size);
    fill (altC);
    ellipse(pos.x, pos.y + 10, size, size);
  }

  void draw() {
    update();
    render();
  }

}