import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/color/color.dart';
import 'package:my_daily_motivation/font/font.dart';

import '../start/get_start.dart';
import '../widget/mainButton.dart';

class SplashSecond extends StatefulWidget {
  const SplashSecond({super.key});

  @override
  State<SplashSecond> createState() => _SplashSecondState();
}

class _SplashSecondState extends State<SplashSecond> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetStart(),
        )));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      body: Center(
          child: SizedBox(
              height: h / 6,
              child: Text(
                'MOTIVATE',
                style: TextStyle(color: white, fontFamily: font, fontSize: 32.dp, fontWeight: FontWeight.bold, letterSpacing: 15),
              ))),
    );
  }
}
