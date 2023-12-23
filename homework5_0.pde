ArrayList<Particle> particles;
int numParticles = 1000;
float repulsionForce = 0.2;
float attractionForce = 0.1;

void setup() {
  size(800, 800);
  background(0);
  particles = new ArrayList<Particle>();
  for (int i = 0; i < numParticles; i++) {
    Particle p = new Particle();
    particles.add(p);
  }
}

void draw() {
  background(0);
  for (Particle p : particles) {
    p.update();
    p.constrain();
    p.applyForces();
    p.display();
  }
}
