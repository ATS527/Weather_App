import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:locationApp/app_screens/home_Screen.dart';
import 'package:locationApp/app_services/weather_data.dart';
import 'package:locationApp/reusable_widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  WeatherData weatherClass;
  @override
  void initState() {
    super.initState();
    weatherClass = new WeatherData();
    gotoHomePage();
  }

  void gotoHomePage() async {
    dynamic weatherData = await weatherClass.getLocationWeather();
    sleep(Duration(seconds: 5));
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return HomeScreen(weatherData: weatherData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bgColorWidget(
        color1: 0xff30E8BF,
        color2: 0xffFF8235,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Weather App",
              style: GoogleFonts.aBeeZee(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            SpinKitPouringHourglass(
              color: Colors.brown[600],
              size: 80.0,
            ),
            SizedBox(height: 80),
            Text(
              "Presented By:",
              style: GoogleFonts.concertOne(
                textStyle: TextStyle(
                    color: Colors.black, fontSize: 30, letterSpacing: 3),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "ATS527",
              style: GoogleFonts.concertOne(
                color: Colors.blueGrey[700],
                fontWeight: FontWeight.bold,
                textStyle: TextStyle(
                    fontSize: 25,
                    // fontWeight: FontWeight.w500,
                    letterSpacing: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
