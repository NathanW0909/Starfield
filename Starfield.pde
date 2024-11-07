import javax.swing.*;
import java.awt.*;
import java.util.Random;

public class StarfieldAnimation extends JPanel {
    
    public static void main(String[] args) {
        JFrame frame = new JFrame("Starfield Animation");
        StarfieldAnimation animation = new StarfieldAnimation();
        frame.add(animation);
        frame.setSize(800, 600);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setVisible(true);

        animation.setup();
        while (true) {
            animation.repaint();  // This will call the paintComponent method repeatedly
            try {
                Thread.sleep(30);  // Pause for 30 milliseconds for smooth animation
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
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

        public void show(Graphics g) {
            g.setColor(color);
            g.fillOval((int) x, (int) y, 5, 5);
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

        public void show(Graphics g) {
            g.setColor(Color.YELLOW);
            g.fillRect((int) x, (int) y, 7, 7);  // Oddball is drawn as a square
        }
    }

    Particle[] particles = new Particle[100];
    Random random = new Random();

    public void setup() {
        particles[0] = new OddballParticle(100, 100, Color.RED, 45, 2.0);
        for (int i = 1; i < particles.length; i++) {
            particles[i] = new Particle(random.nextInt(800), random.nextInt(600), Color.WHITE, random.nextInt(360), 1.0);
        }
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        for (Particle p : particles) {
            p.move();
            p.show(g);
        }
    }
}
