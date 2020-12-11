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
  var height;
  var width;

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
    setState(() {
      data = weatherData;
    });
  }

  Future<void> getCityWeather(String cityName) async {
    weatherData = await weatherValues.getCityWeather(cityName);
    setState(() {
      data = weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    // print(weatherData);
    weatherValues.assignValues(weatherData);
    // print(weatherValues.cityName);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: bgColorWidget(
        color1: 0xff5A50F1,
        color2: 0xff91D1FD,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            refreshButton();
                            print(weatherData);
                          });
                        },
                        child: Icon(
                          Icons.near_me,
                          color: Colors.white,
                          size: width * 0.12,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.all(width * 0.03),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 180),
                            width: _folded ? width * 0.145 : width * 0.6,
                            height: height * 0.085,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white38,
                              boxShadow: kElevationToShadow[6],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: width * 0.05),
                                    child: !_folded
                                        ? TextField(
                                            controller: myController,
                                            onChanged: (value) =>
                                                enteredCity = value,
                                            style: GoogleFonts.aBeeZee(
                                              color: Colors.white,
                                              fontSize: height * 0.033,
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
                                        topLeft:
                                            Radius.circular(_folded ? 32 : 0),
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
                                          getCityWeather(enteredCity);
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
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: height * 0.009,
                      ),
                      Text(
                        weatherValues.cityName,
                        style: GoogleFonts.aBeeZee(
                            color: Colors.white,
                            fontSize: height * 0.037,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.001,
                  ),
                  Text(
                    "${weatherValues.temperature.toString()}°C",
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: width * 0.23,
                    ),
                  ),
                  Text(
                    "${weatherValues.maxTemp}° / ${weatherValues.minTemp}° Feels like ${weatherValues.feelTemp}°",
                    style: GoogleFonts.aBeeZee(
                      color: Colors.white,
                      fontSize: width * 0.06,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: width * 0.001,
                  ),
                  Text(
                    weatherValues.condition,
                    style: GoogleFonts.aBeeZee(
                      fontSize: height * 0.06,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 10, right: 10),
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
                          height: height * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            paramatrisedData(
                                assetImage: "assets/visibility.png",
                                parameter: "Visibility",
                                value:
                                    "${weatherValues.visibility.toString()} m"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
