import 'dart:math' as math;

class PhysicsUtils {
  static double calculateBallAcceleration(double beamAngle) {
    const double gravity = 9.81;
    return gravity * math.sin(beamAngle);
  }

  static double calculateDampening(double velocity) {
    const double dampening = 0.98;
    return velocity * dampening;
  }

  static bool isStable(double position, double velocity, double threshold) {
    return position.abs() < threshold && velocity.abs() < threshold;
  }
}