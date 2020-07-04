library particle_fountain;

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:particle_fountain/particleModel.dart';
import 'package:simple_animations/simple_animations.dart';

class Particles extends StatefulWidget {
  final int numberOfParticles;
  final double height;
  final double width;

  Particles(this.numberOfParticles, this.height, [this.width]);

  @override
  _ParticlesState createState() => _ParticlesState();
}

class _ParticlesState extends State<Particles> {
  final Random random = Random();

  final List<ParticleModel> particles = [];

  @override
  void initState() {
    generate();
    super.initState();
  }

  void generate() {
    particles.clear();
    List.generate(widget.numberOfParticles, (index) {
      particles.add(ParticleModel(random, widget.height, widget.width));
    });
  }

  void update() {
    for (int i = 0; i < widget.numberOfParticles; i++) {
      particles[i].changeHW(widget.height, widget.width);
    }
  }

  @override
  Widget build(BuildContext context) {
    update();
    // print(widget.height);
    // ignore: deprecated_member_use
    return Rendering(
      builder: (context, time) {
        _simulateParticles(time);
        return CustomPaint(
          painter: ParticlePainter(particles, time),
        );
      },
    );
  }

  _simulateParticles(Duration time) {
    particles.forEach((particle) => particle.maintainRestart(time));
  }
}
