import 'package:flutter/material.dart';
import 'package:particle_fountain/particle_fountain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double h = 1;
  double w = 1;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            child: ParticleFountain(
              numberOfParticles: 30,
              height: h,
              width: w,
              color: Colors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Slider(
                min: 0,
                max: 1,
                value: h,
                onChanged: (height) {
                  setState(() {
                    h = height;
                  });
                },
              ),
              Slider(
                min: 0,
                max: 1,
                value: w,
                onChanged: (width) {
                  setState(() {
                    w = width;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
