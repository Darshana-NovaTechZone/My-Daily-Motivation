import 'package:flutter/material.dart';
import 'package:my_daily_motivation/UI/splash/splash2.dart';
import 'package:my_daily_motivation/color/color.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SplashSecond(),
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
      body: Center(child: SizedBox(height: h / 6, child: Image.asset('assets/icon.PNG'))),
    );
  }
}
