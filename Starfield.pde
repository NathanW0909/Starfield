import java.awt.Color;

public class StarfieldAnimation {
    
    public static void main(String[] args) {
        StarfieldAnimation animation = new StarfieldAnimation();
        animation.setup();
        animation.draw();
    }

    class Particle {
        double x, y;
        Color color;
        double angle;
        double speed;

        public Particle(double x, double y, Color color, double angle, double speed) {
            this.x = x;
            this.y = y;
            this.color = color;
            this.angle = angle;
            this.speed = speed;
        }

        public void move() {
            x += Math.cos(Math.toRadians(angle)) * speed;
            y += Math.sin(Math.toRadians(angle)) * speed;
        }

        public void show() {
            System.out.println("Drawing particle at (" + x + ", " + y + ")");
        }
    }

    class OddballParticle extends Particle {

        public OddballParticle(double x, double y, Color color, double angle, double speed) {
            super(x, y, color, angle, speed);
        }

        public void move() {
            angle += 10;
            super.move();
        }

        public void show() {
            System.out.println("Drawing Oddball particle at (" + x + ", " + y + ")");
        }
    }

    Particle[] particles = new Particle[10];

    public void setup() {
        particles[0] = new OddballParticle(100, 100, Color.RED, 45, 2.0);
        for (int i = 1; i < particles.length; i++) {
            particles[i] = new Particle(Math.random() * 800, Math.random() * 600, Color.WHITE, Math.random() * 360, 1.0);
        }
    }

    public void draw() {
        for (Particle p : particles) {
            p.move();
            p.show();
        }
    }
}
