import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import '../color/color.dart';
import '../font/font.dart';

class FavoriteMSG extends StatelessWidget {
  const FavoriteMSG({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.star,
          color: Colors.white24,
          size: 55,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "STAY MOTIVATED",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: white,
              fontFamily: font,
              fontSize: 18.dp,
              wordSpacing: 1,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tap",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
                fontFamily: font,
                fontSize: 14.dp,
                wordSpacing: 1,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.white70,
            ),
            Text(
              "on any $text to ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white54,
                fontFamily: font,
                fontSize: 14.dp,
                wordSpacing: 1,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          "save it for later",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white54,
            fontFamily: font,
            fontSize: 14.dp,
            wordSpacing: 1,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    )));
  }
}
