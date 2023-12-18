import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gif_view/gif_view.dart';
import 'package:my_daily_motivation/UI/start/select_one.dart';
import 'package:my_daily_motivation/color/color.dart';
import 'package:my_daily_motivation/font/font.dart';

import '../widget/mainButton.dart';

class GetStart extends StatefulWidget {
  const GetStart({super.key});

  @override
  State<GetStart> createState() => _GetStartState();
}

class _GetStartState extends State<GetStart> {
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      body: Stack(
        children: [
          GifView.asset(
            'assets/ezgif.com-optimize.gif',
            height: h,
            width: h,
            frameRate: 30, // default is 15 FPS
            fit: BoxFit.cover,
          ),
          Container(
            height: h,
            width: w,
            color: black.withOpacity(0.7),
          ),
          SizedBox(
            height: h,
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h / 10,
                ),
                Text(
                  'MOTIVATE',
                  style: TextStyle(color: white, fontFamily: font, fontSize: 28.dp, fontWeight: FontWeight.bold, letterSpacing: 10),
                ),
                Spacer(
                  flex: 5,
                ),
                Text(
                  'YOUR JOURNEY',
                  style: TextStyle(
                    color: white,
                    fontFamily: rubik,
                    fontSize: 22.dp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'BEGINS \nHERE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontFamily: rubik,
                    fontSize: 42.dp,
                    wordSpacing: 1,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                Text(
                  "Ready to get motivated?\n We've got a few quetions to \nhelp you get started!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontFamily: font,
                    fontSize: 14.dp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(
                  flex: 2,
                ),
                MainButton(
                    color: liteBlue,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectOne(),
                          ));
                    },
                    text: 'GET STARTED',
                    color2: white),
                Spacer(
                  flex: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
