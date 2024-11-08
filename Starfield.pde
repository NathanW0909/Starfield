import processing.core.PApplet;
import java.util.Random;

public class Starfield extends PApplet {

    Particle[] particles;

    public static void main(String[] args) {
        PApplet.main("Starfield");
    }

    public void settings() {
        size(800, 800);
    }

    public void setup() {
        particles = new Particle[100];
        for (int i = 0; i < particles.length; i++) {
            if (i == 0) {
                particles[i] = new OddballParticle(width / 2, height / 2);
            } else {
                particles[i] = new Particle(random(width), random(height), random(TWO_PI), random(1, 3), color(random(255), random(255), random(255)));
            }
        }
    }

    public void draw() {
        background(0);
        for (Particle particle : particles) {
            particle.move();
            particle.show();
        }
    }

    class Particle {
        double x, y, speed, angle;
        int col;

        Particle(double x, double y, double angle, double speed, int col) {
            this.x = x;
            this.y = y;
            this.angle = angle;
            this.speed = speed;
            this.col = col;
        }

        void move() {
            x += cos((float) angle) * speed;
            y += sin((float) angle) * speed;
        }

        void show() {
            fill(col);
            noStroke();
            ellipse((float) x, (float) y, 5, 5);
        }
    }

    class OddballParticle extends Particle {

        OddballParticle(double x, double y) {
            super(x, y, random(TWO_PI), 2, color(255, 0, 0));
        }

        void move() {
            x += cos((float) angle) * speed * 1.5;
            y += sin((float) angle) * speed * 1.5;
            angle += random(-0.1, 0.1); // Make the Oddball move in a more erratic pattern
        }

        void show() {
            fill(col);
            noStroke();
            ellipse((float) x, (float) y, 10, 10); // Make the Oddball larger
        }
    }
}
