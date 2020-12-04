import 'package:flutter/material.dart';
import 'package:locationApp/app_services/weather_data.dart';
import 'package:locationApp/reusable_widgets.dart';

class HomeScreen extends StatefulWidget {
  final weatherData;
  HomeScreen({this.weatherData});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherData weatherValues;

  @override
  void initState() {
    super.initState();
    weatherValues = new WeatherData(weatherData: widget.weatherData);
    weatherValues.assignValues();
    print(weatherValues.cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgColorWidget(
        color1: 0xff021B79,
        color2: 0xff0575E6,
        child: Container(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
