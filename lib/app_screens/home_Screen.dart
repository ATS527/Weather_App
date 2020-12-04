import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  weatherValues.cityName,
                  style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "${weatherValues.temperature.toString()}°",
              style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontSize: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "${weatherValues.maxTemp}° / ${weatherValues.minTemp}° Feels like ${weatherValues.feelTemp}°",
              style: GoogleFonts.aBeeZee(
                color: Colors.white,
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              weatherValues.condition,
              style: GoogleFonts.aBeeZee(
                fontSize: 25,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  paramatrisedData(
                      assetImage: "assets/pressure.png",
                      parameter: "Pressure",
                      value: weatherValues.pressure.toString()),
                  paramatrisedData(
                      assetImage: "assets/humidity.png",
                      parameter: "Humidity",
                      value: weatherValues.humidity.toString()),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xff8EB4F3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xff8EB4F3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  paramatrisedData(
                      assetImage: "assets/windSpeed.png",
                      parameter: "Wind Speed",
                      value: "${weatherValues.windSpeed.toString()} km/h"),
                  paramatrisedData(
                    assetImage: "assets/windDirection.png",
                    parameter: "Wind Degree",
                    value: "${weatherValues.windDegree}°",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
