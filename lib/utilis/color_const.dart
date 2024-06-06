import 'package:flutter/material.dart';

class ColorConst {
  static const Gradient background = SweepGradient(
      colors: [
        Color.fromARGB(255, 0, 0, 0), // yellow
        Color.fromARGB(255, 35, 23, 42), // yellow
        Color.fromARGB(255, 37, 4, 60), // yellow
        Color.fromARGB(255, 21, 2, 34),
        Color.fromARGB(255, 37, 27, 63),
        Color.fromARGB(255, 47, 14, 69),
        Color.fromARGB(255, 0, 0, 0),
        Color.fromARGB(255, 42, 13, 1),
        Color.fromARGB(255, 239, 12, 12),
      ],
      endAngle: 15,
      center: Alignment.topCenter,
      tileMode: TileMode.repeated,
      transform: GradientRotation(5),
      startAngle: 5);

  static Color foregroundcolor = Colors.purpleAccent.shade700;
  static Color black1 = Colors.black;
  static Color userContainer = Colors.purple.shade900;
  static Color userContainerborder = Colors.purple.shade100;
  static Color userContainerText = Colors.purple.shade100;
  static Color botMessageContainer = Colors.purple.shade300;
}
//Color.fromARGB(255, 173, 20, 242), //
//Colors.black,