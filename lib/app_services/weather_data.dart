class WeatherData {
  dynamic weatherData;
  var temperature;
  var maxTemp;
  var minTemp;
  var feelTemp;
  var pressure;
  var humidity;
  var visibility;
  var windSpeed;
  var windDegree;
  String condition;
  String cityName;

  WeatherData({this.weatherData});

  void assignValues() {
    if (weatherData == null) {
      print("There is some error!");
      return;
    } else {
      temperature = weatherData["main"]["temp"];
      cityName = weatherData["name"];
      maxTemp = weatherData["main"]["temp_max"];
      minTemp = weatherData["main"]["temp_min"];
      feelTemp = weatherData["main"]["feels_like"];
      condition = weatherData["weather"][0]["main"];
      pressure = weatherData["main"]["pressure"];
      humidity = weatherData["main"]["humidity"];
      visibility = weatherData["visibility"];
      windSpeed = weatherData["wind"]["speed"];
      windDegree = weatherData["wind"]["deg"];
    }
  }
}
