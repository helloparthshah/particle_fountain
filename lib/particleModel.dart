import 'dart:math';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ParticleModel {
  Animatable tween;
  double size;
  // ignore: deprecated_member_use
  AnimationProgress animationProgress;
  Random random;
  double height;
  double width;
  Color color;

  ParticleModel(this.random, this.height, this.width, this.color) {
    restart();
  }

  restart({Duration time = Duration.zero}) {
    if (width == null) {
      width = height;
    }
    final startPosition =
        Offset(/* -0.2 + 1.4 * random.nextDouble() */ 0.5, 1.2);
    final endPosition = Offset(
        /* -0.2 + 1.4 * random.nextDouble() */ -0.4 +
            (1 - width) +
            (1.4 + 0.4 - 2 * (1 - width)) * random.nextDouble(),
        1 - height);
    final duration = Duration(milliseconds: 500 + random.nextInt(1000));

    // ignore: deprecated_member_use
    tween = MultiTrackTween([
      // ignore: deprecated_member_use
      Track("x").add(
          duration, Tween(begin: startPosition.dx, end: endPosition.dx),
          curve: Curves.easeInOutSine),
      // ignore: deprecated_member_use
      Track("y").add(
          duration, Tween(begin: startPosition.dy, end: endPosition.dy),
          curve: Curves.easeIn),
    ]);
    // ignore: deprecated_member_use
    animationProgress = AnimationProgress(duration: duration, startTime: time);
    size = 0.2 + random.nextDouble() * 0.4;
  }

  changeHW(double h, double w) {
    height = h;
    width = w;
  }

  maintainRestart(Duration time) {
    if (animationProgress.progress(time) == 1.0) {
      restart(time: time);
    }
  }
}

class ParticlePainter extends CustomPainter {
  List<ParticleModel> particles;
  Duration time;
  Color color;

  ParticlePainter(this.particles, this.time, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color.withAlpha(50);

    particles.forEach((particle) {
      var progress = particle.animationProgress.progress(time);
      final animation = particle.tween.transform(progress);
      final position =
          Offset(animation["x"] * size.width, animation["y"] * size.height);
      canvas.drawCircle(position, size.width * 0.2 * particle.size, paint);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
