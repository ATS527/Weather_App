import 'package:flutter/material.dart';
import 'app_screens/loading_Screen.dart';
import 'package:flutter/services.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MaterialApp(
      home: LoadingScreen(),
    ));
  });
}
