import 'package:flutter/material.dart';
import 'package:locationApp/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  final weatherData;
  HomeScreen({this.weatherData});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.weatherData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgColorWidget(
        color1: 0xffee0979,
        color2: 0xffff6a00,
        child: Container(
          child: Text(""),
        ),
      ),
    );
  }
}
