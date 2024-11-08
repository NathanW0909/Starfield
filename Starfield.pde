Particle[] particles;

void setup() {
    size(800, 800);
    particles = new Particle[100];
    
    // Initialize particles with one OddballParticle and the rest as regular Particles
    for (int i = 0; i < particles.length; i++) {
        if (i == 0) {
            particles[i] = new OddballParticle(width / 2, height / 2);
        } else {
            particles[i] = new Particle(random(width), random(height), random(TWO_PI), random(1, 3), color(random(255), random(255), random(255)));
        }
    }
}

void draw() {
    background(0);
    for (Particle particle : particles) {
        particle.move();
        particle.show();
    }
}

class Particle {
    float x, y, speed, angle;
    int col;

    Particle(float x, float y, float angle, float speed, int col) {
        this.x = x;
        this.y = y;
        this.angle = angle;
        this.speed = speed;
        this.col = col;
    }

    void move() {
        x += cos(angle) * speed;
        y += sin(angle) * speed;
    }

    void show() {
        fill(col);
        noStroke();
        ellipse(x, y, 5, 5);
    }
}

class OddballParticle extends Particle {

    OddballParticle(float x, float y) {
        super(x, y, random(TWO_PI), 2, color(255, 0, 0));
    }

    void move() {
        x += cos(angle) * speed * 1.5;
        y += sin(angle) * speed * 1.5;
        angle += random(-0.1, 0.1); // Make the Oddball move in a more erratic pattern
    }

    void show() {
        fill(col);
        noStroke();
        ellipse(x, y, 10, 10); // Make the Oddball larger
    }
}
