import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class AnimatedSearchBar extends StatefulWidget {
  @override
  _AnimatedSearchBarState createState() => _AnimatedSearchBarState();
}

class _AnimatedSearchBarState extends State<AnimatedSearchBar> {
  bool _folded = true;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 180),
      width: _folded ? 56 : 280,
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
                      style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      onChanged: (value) {
                        print(value);
                      },
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
                  bottomLeft: Radius.circular(_folded ? 32 : 0),
                  bottomRight: Radius.circular(32),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    _folded ? Icons.search : Icons.close,
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _folded = !_folded;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
