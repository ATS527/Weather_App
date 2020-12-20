import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:locationApp/app_services/weather_data.dart';
import 'package:locationApp/reusable_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locationApp/app_screens/home_Screen.dart';
import 'package:flutter/services.dart';

var height;
var width;

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
    dynamic weatherData;
    try {
      weatherData = await weatherClass.getLocationWeather();
    } catch (e) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }

    sleep(Duration(seconds: 5));
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (BuildContext context) {
        return HomeScreen(weatherData: weatherData);
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print("height = $height");
    return Scaffold(
      body: bgColorWidget(
        color1: 0xffFF8235,
        color2: 0xff30E8BF,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Weather App",
                  style: GoogleFonts.abel(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.08,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 2),
                  ),
                ),
                SizedBox(
                  height: height * 0.07,
                ),
                SpinKitPouringHourglass(
                  color: Colors.brown[600],
                  size: height * 0.13,
                ),
                SizedBox(height: height * 0.17),
                Text(
                  "Presented By:",
                  style: GoogleFonts.concertOne(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.04,
                        letterSpacing: 3),
                  ),
                ),
                SizedBox(height: height * 0.04),
                Text(
                  "ATS527",
                  style: GoogleFonts.concertOne(
                    color: Colors.blueGrey[700],
                    fontWeight: FontWeight.bold,
                    textStyle: TextStyle(
                        fontSize: height * 0.04,
                        // fontWeight: FontWeight.w500,
                        letterSpacing: 3),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
