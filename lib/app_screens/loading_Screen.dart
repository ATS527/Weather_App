import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:locationApp/app_screens/home_Screen.dart';
import 'package:locationApp/location_class.dart';
import 'package:locationApp/networking.dart';
import 'package:locationApp/reusable_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locationApp/constants.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationClass _location = new LocationClass();

  @override
  void initState() {
    super.initState();
    gotoHomePage();
  }

  void gotoHomePage() async {
    await _location.locationRequest();
    await _location.getLocationValues();
    Networking networking = Networking(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=${_location.latitude}&lon=${_location.longitude}&appid=$kApiKey");

    var weatherData = await networking.getData();
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
        color1: 0xffB7F8DB,
        color2: 0xff50A7C2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SpinKitRotatingCircle(
              color: Colors.orange[800],
              size: 80.0,
            ),
            SizedBox(
              height: 70.0,
            ),
            Text(
              "Weather App",
              style: GoogleFonts.concertOne(
                textStyle: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w200,
                    letterSpacing: 2),
              ),
            ),
            SizedBox(height: 120),
            Text(
              "Presented By:",
              style: GoogleFonts.concertOne(
                textStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w100,
                    letterSpacing: 3),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "ATS527",
              style: GoogleFonts.concertOne(
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
