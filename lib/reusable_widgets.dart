import 'package:flutter/material.dart';

Widget bgColorWidget({color1, color2, child}) {
  return Container(
    width: double.infinity,
    height: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(color1), Color(color2)]),
    ),
    child: child,
  );
}
