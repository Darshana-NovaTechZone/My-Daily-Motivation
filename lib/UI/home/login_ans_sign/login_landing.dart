import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/UI/home/login_ans_sign/login.dart';
import 'package:my_daily_motivation/UI/home/login_ans_sign/signup.dart';

import 'package:my_daily_motivation/color/color.dart';
import 'package:page_transition/page_transition.dart';

import '../../../font/font.dart';
import '../../widget/login_button.dart';

class LoginLanding extends StatefulWidget {
  const LoginLanding({super.key});

  @override
  State<LoginLanding> createState() => _LoginLandingState();
}

class _LoginLandingState extends State<LoginLanding> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: CircleAvatar(
                backgroundColor: white.withOpacity(0.1),
                child: Icon(
                  Icons.expand_more,
                  color: white,
                ))),
      ),
      backgroundColor: background,
      body: SizedBox(
        width: w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'MOTIVATE',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: white.withOpacity(0.9),
                fontFamily: font,
                fontSize: 26.dp,
                wordSpacing: 1,
                letterSpacing: 6,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Sign up to save and sync",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: white.withOpacity(0.7),
                fontFamily: font,
                fontSize: 14.dp,
                wordSpacing: 1,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "your",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontFamily: font,
                    fontSize: 14.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.white70,
                ),
                Text(
                  " favorites",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontFamily: font,
                    fontSize: 14.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            LoginButton(
              color2: white,
              color: liteBlue,
              text: 'SIGN UP WITH EMAIL',
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: SignUp(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Have an account?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white.withOpacity(0.7),
                    fontFamily: font,
                    fontSize: 14.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.bottomToTop,
                        child: Login(),
                      ),
                    );
                  },
                  child: Text(
                    "Log in",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 3, 71, 127),
                      fontFamily: font,
                      fontSize: 14.dp,
                      wordSpacing: 1,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
