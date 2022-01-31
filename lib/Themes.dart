// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';

List<Color> theme = Themes().theme1;
// tow different colors
Color themeColor = Themes().theme1[0]; //first color
Color iconColor = Themes().theme1[1]; //second color
Color percentColor = Colors.black;

class Themes {
  List<Color> theme1 = [Colors.white70, Colors.blueAccent];
  List<Color> theme2 = [Colors.amberAccent, Colors.redAccent];
  List<Color> theme3 = [Colors.cyanAccent, Colors.blueAccent];
  List<Color> theme4 = [Colors.yellowAccent, Colors.deepOrangeAccent];
  List<Color> theme5 = [Colors.white, Colors.black];
}

class MyClipper extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(50, 50, 250, 250);
  }

  bool shouldReclip(oldClipper) {
    return true;
  }
}
