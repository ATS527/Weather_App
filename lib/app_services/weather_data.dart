class WeatherData {
  dynamic weatherData;
  var temperature; //done
  var maxTemp; //done
  var minTemp; //done
  var feelTemp; //done
  var pressure; //done
  var humidity; //done
  var visibility;
  var windSpeed;
  var windDegree;
  String condition; //done
  String cityName; //done

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
