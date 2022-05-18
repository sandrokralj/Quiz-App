import 'package:flutter/material.dart';

const kSecondaryColor = Color(0xFF8B94BC);
const kGreenColor = Color(0xFF6AC259);
const kRedColor = Color(0xFFE92E30);
const kGrayColor = Color(0xFFC1C1C1);
const kBlackColor = Color(0xFF101010);
const kPrimaryGradient = LinearGradient(
  colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
);
const boxShadows = [
  BoxShadow(
      // bottomLeft
      offset: Offset(-1.5, -1.5),
      color: Colors.black),
  BoxShadow(
      // bottomRight
      offset: Offset(1.5, -1.5),
      color: Colors.black),
  BoxShadow(
      // topRight
      offset: Offset(1.5, 1.5),
      color: Colors.black),
  BoxShadow(
      // topLeft
      offset: Offset(-1.5, 1.5),
      color: Colors.black),
];
const shadows = [
  Shadow(
// bottomLeft
      offset: Offset(-1.5, -1.5),
      color: Color(0xFF1C2341)),
  Shadow(
// bottomRight
      offset: Offset(1.5, -1.5),
      color: Color(0xFF1C2341)),
  Shadow(
// topRight
      offset: Offset(1.5, 1.5),
      color: Color(0xFF1C2341)),
  Shadow(
// topLeft
      offset: Offset(-1.5, 1.5),
      color: Color(0xFF1C2341)),
];
const double kDefaultPadding = 20.0;
