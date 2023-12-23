class Particle {
  float x, y;
  float speed;
  float size;
  float rotationSpeed;
  color particleColor;

  Particle() {
    x = random(width);
    y = random(height);
    speed = random(1, 3);
    size = random(3, 6);
    rotationSpeed = random(0.01, 0.03);
    particleColor = random(1) > 0.5 ? color(255) : color(0, 0, 255);
  }

  void update() {
    x += cos(rotationSpeed) * speed;
    y += sin(rotationSpeed) * speed;
  }

  void constrain() {
    if (x < 0 || x > width) {
      speed *= -1;
    }
    if (y < 0 || y > height) {
      speed *= -1;
    }
  }

  void applyForces() {
    for (Particle other : particles) {
      if (other != this) {
        float dx = other.x - x;
        float dy = other.y - y;
        float distance = sqrt(dx * dx + dy * dy);
        float force = 0;

        if (particleColor == other.particleColor) {
          if (particleColor == color(255)) {
            force = -attractionForce / (distance * distance);
          } else {
            force = attractionForce / (distance * distance);
          }
        } else {
          force = repulsionForce / (distance * distance);
        }

        speed += force;
      }
    }
  }

  void display() {
    noStroke();
    fill(particleColor);
    ellipse(x, y, size, size);
  }
}
