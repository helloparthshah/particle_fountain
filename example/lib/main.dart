import 'package:flutter/material.dart';
import 'package:particle_fountain/particle_fountain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints.expand(),
            child: Particles(30, h /* , 0.2 */),
          ),
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
        ],
      ),
    );
  }
}
