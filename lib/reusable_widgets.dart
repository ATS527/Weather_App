import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:locationApp/app_screens/loading_Screen.dart';

Widget bgColorWidget({color1, color2, child}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(color1), Color(color2)]),
    ),
    child: child,
  );
}

Widget paramatrisedData({String assetImage, String parameter, var value}) {
  return Row(
    children: <Widget>[
      Image(
        image: AssetImage(
          assetImage,
        ),
        width: 35,
        height: 35,
      ),
      SizedBox(
        width: 7,
      ),
      Column(
        children: <Widget>[
          Text(
            parameter,
            style: GoogleFonts.aBeeZee(
              fontSize: 20,
              color: Colors.blueGrey[800],
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            value,
            style: GoogleFonts.aBeeZee(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    ],
  );
}
