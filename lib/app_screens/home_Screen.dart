import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locationApp/app_services/weather_data.dart';
import 'package:locationApp/reusable_widgets.dart';
import 'package:locationApp/app_screens/search_screen.dart';

class HomeScreen extends StatefulWidget {
  final weatherData;
  HomeScreen({this.weatherData});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherData weatherValues = new WeatherData();
  dynamic weatherData;
  @override
  void initState() {
    super.initState();
    weatherData = widget.weatherData;
  }

  void refreshButton() async {
    weatherData = await weatherValues.getLocationWeather();
  }

  @override
  Widget build(BuildContext context) {
    print(weatherData);
    weatherValues.assignValues(weatherData);
    print(weatherValues.cityName);
    return Scaffold(
      body: bgColorWidget(
        color1: 0xff5A50F1,
        color2: 0xff91D1FD,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          refreshButton();
                        });
                      },
                      child: Icon(
                        Icons.near_me,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    FlatButton.icon(
                      label: Text(
                        "Location",
                        style: GoogleFonts.aBeeZee(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        print("pressed");
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SearchPage();
                        }));
                      },
                    ),
                  ],
                ),
              ),
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
                height: 5,
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
                height: 5,
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
                height: 5,
              ),
              Container(
                margin: EdgeInsets.all(20),
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
                  color: Color(0xff8DB3F2),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        paramatrisedData(
                            assetImage: "assets/windSpeed.png",
                            parameter: "Wind Speed",
                            value:
                                "${weatherValues.windSpeed.toString()} km/h"),
                        paramatrisedData(
                          assetImage: "assets/windDirection.png",
                          parameter: "Wind Degree",
                          value: "${weatherValues.windDegree}°",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        paramatrisedData(
                            assetImage: "assets/visibility.png",
                            parameter: "Visibility",
                            value: "${weatherValues.visibility.toString()} m"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
