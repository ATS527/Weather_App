import 'package:geolocator/geolocator.dart';
import 'dart:io';

class LocationClass {
  bool isLocationServiceEnabledVar; //true or false
  LocationPermission
      locationPermissionVar; //LocationPermission.allowed || LocationPermission.denied
  LocationPermission
      requestPermissionVar; //LocationPermission.allowed || LocationPermission.denied

  Position position; //position in lattitude and longitude

  double latitude;
  double longitude;

  //Function to Location service on/off
  Future<void> isLocationServiceEnabled() async {
    isLocationServiceEnabledVar = await Geolocator.isLocationServiceEnabled();
  }

  //status of location permission
  Future<void> locationPermission() async {
    locationPermissionVar = await Geolocator.checkPermission();
  }

  //to send the permission request
  Future<void> requestPermission() async {
    requestPermissionVar = await Geolocator.requestPermission();
  }

  //  For IOS
  // void openSettings() async {
  //   await Geolocator.openAppSettings();
  // }

  //opens location settings page of phone to manually enable location
  Future<void> openLocationSettings() async {
    await Geolocator.openLocationSettings();
  }

  //Location requesting Function as a whole
  Future<void> locationRequest() async {
    await requestPermission();
    if (requestPermissionVar == LocationPermission.denied ||
        requestPermissionVar == LocationPermission.deniedForever) {
      await requestPermission();
    }
    if (requestPermissionVar == LocationPermission.denied ||
        requestPermissionVar == LocationPermission.deniedForever) {
      print("please Quit");
      return;
    }
    await isLocationServiceEnabled();
    if (isLocationServiceEnabledVar == false) {
      await openLocationSettings();
      print("You have 12 seconds to change the settings.....");
      sleep(Duration(seconds: 12));
      print("Sucess!");
    } else
      print("I already enabled it...");
  }

  //Assigning value of location recieved to a variable
  Future<void> getLocationValues() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
  }
}
