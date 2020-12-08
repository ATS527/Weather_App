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
  dynamic weatherData;
  bool _folded = true;
  String enteredCity;
  dynamic data;

  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    weatherValues = new WeatherData();
    weatherData = widget.weatherData;
  }

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   myController.dispose();
  //   super.dispose();
  // }

  Future<void> refreshButton() async {
    weatherData = await weatherValues.getLocationWeather();
    return weatherData;
  }

  Future<void> getCityWeather(String cityName) async {
    weatherData = await weatherValues.getCityWeather(cityName);
  }

  @override
  Widget build(BuildContext context) {
    // print(weatherData);
    weatherValues.assignValues(weatherData);
    // print(weatherValues.cityName);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: bgColorWidget(
        color1: 0xff5A50F1,
        color2: 0xff91D1FD,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        data = refreshButton();
                        print(weatherData);
                      });
                    },
                    child: Icon(
                      Icons.near_me,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(25),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 180),
                        width: _folded ? 56 : 240,
                        height: 56,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white38,
                          boxShadow: kElevationToShadow[6],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(left: 16),
                                child: !_folded
                                    ? TextField(
                                        controller: myController,
                                        onChanged: (value) =>
                                            enteredCity = value,
                                        style: GoogleFonts.aBeeZee(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                        decoration: InputDecoration(
                                            hintText: 'Search any City',
                                            hintStyle: GoogleFonts.aBeeZee(
                                              color: Colors.white,
                                            ),
                                            border: InputBorder.none),
                                      )
                                    : null,
                              ),
                            ),
                            Container(
                              child: Material(
                                type: MaterialType.transparency,
                                child: InkWell(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(_folded ? 32 : 0),
                                    topRight: Radius.circular(32),
                                    bottomLeft:
                                        Radius.circular(_folded ? 32 : 0),
                                    bottomRight: Radius.circular(32),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Icon(
                                      _folded ? Icons.search : Icons.done,
                                      color: Colors.white,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _folded = !_folded;
                                      // enteredCity = myController.text;
                                      getCityWeather(enteredCity);
                                      // weatherData = weatherValues
                                      //     .getCityWeather(enteredCity);
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                ],
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
              Text(
                "${weatherValues.temperature.toString()}°",
                style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontSize: 100,
                ),
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
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
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
                      height: 35,
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
