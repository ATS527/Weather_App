import 'package:locationApp/app_services/location_class.dart';
import 'package:locationApp/app_services/networking.dart';
import 'package:locationApp/constants.dart';

class WeatherData {
  dynamic weatherData;
  var temperature; //done
  var maxTemp; //done
  var minTemp; //done
  var feelTemp; //done
  var pressure; //done
  var humidity; //done
  var visibility; //done
  var windSpeed; //done
  var windDegree; //done
  String condition; //done
  String cityName; //done

  LocationClass location = new LocationClass();
  Networking networkHelper = new Networking();

  void assignValues(dynamic data) {
    if (data == null) {
      print("There is some error!");
      return;
    } else {
      temperature = data["main"]["temp"];
      cityName = data["name"];
      maxTemp = data["main"]["temp_max"];
      minTemp = data["main"]["temp_min"];
      feelTemp = data["main"]["feels_like"];
      condition = data["weather"][0]["main"];
      pressure = data["main"]["pressure"];
      humidity = data["main"]["humidity"];
      visibility = data["visibility"];
      windSpeed = data["wind"]["speed"];
      windDegree = data["wind"]["deg"];
    }
  }

  Future<dynamic> getLocationWeather() async {
    await location.locationRequest();
    await location.getLocationValues();
    weatherData = await networkHelper.getData(
        "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric");
    return weatherData;
  }

  Future<dynamic> getCityWeather(cityName) async {
    weatherData = await networkHelper.getData(
        "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$kApiKey&units=metric");
    return weatherData;
  }
}
