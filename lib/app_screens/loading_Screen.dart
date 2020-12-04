import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:locationApp/app_screens/home_Screen.dart';
import 'package:locationApp/reusable_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locationApp/constants.dart';
import 'package:locationApp/app_services/location_class.dart';
import 'package:locationApp/app_services/networking.dart';

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
            "https://api.openweathermap.org/data/2.5/weather?lat=${_location.latitude}&lon=${_location.longitude}&appid=$kApiKey&units=metric");

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
