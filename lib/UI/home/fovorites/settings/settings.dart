import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:my_daily_motivation/color/color.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../font/font.dart';
import '../../login_ans_sign/login_landing.dart';
import '../../notification/notification.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
      backgroundColor: background,
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'DONE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white,
                      fontFamily: font,
                      fontSize: 14.dp,
                      wordSpacing: 1,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  'SETTINGS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white.withOpacity(0.8),
                    fontFamily: font,
                    fontSize: 14.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.bottomToTop,
                    child: LoginLanding(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.only(left: 16),
              height: h / 13,
              child: Row(
                children: [
                  Icon(
                    Icons.login,
                    color: white.withOpacity(0.8),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'SIGN UP OR LOG IN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white,
                      fontFamily: font,
                      fontSize: 14.dp,
                      wordSpacing: 1,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.white24,
            height: 40,
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: NotificationScreen(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.only(left: 16),
                height: h / 13,
                child: Row(
                  children: [
                    Icon(
                      Icons.notification_important,
                      color: white.withOpacity(0.8),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'NOTIFICATIONS',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white.withOpacity(0.9),
                        fontFamily: font,
                        fontSize: 14.dp,
                        wordSpacing: 1,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: LoginLanding(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.only(left: 16),
                height: h / 13,
                child: Row(
                  children: [
                    Icon(
                      Icons.play_circle_fill_outlined,
                      color: white.withOpacity(0.8),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'SUBMIT CONTENT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white.withOpacity(0.9),
                        fontFamily: font,
                        fontSize: 14.dp,
                        wordSpacing: 1,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: LoginLanding(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.only(left: 16),
                height: h / 13,
                child: Row(
                  children: [
                    Icon(
                      Icons.quiz_rounded,
                      color: white.withOpacity(0.8),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'MOTIVATE FAQ & MORE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white.withOpacity(0.9),
                        fontFamily: font,
                        fontSize: 14.dp,
                        wordSpacing: 1,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: LoginLanding(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.only(left: 16),
                height: h / 13,
                child: Row(
                  children: [
                    Icon(
                      Icons.question_answer_rounded,
                      color: white.withOpacity(0.8),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'FEEDBACK & SUPPORT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white.withOpacity(0.9),
                        fontFamily: font,
                        fontSize: 14.dp,
                        wordSpacing: 1,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: LoginLanding(),
                    ));
              },
              child: Container(
                padding: EdgeInsets.only(left: 16),
                height: h / 13,
                child: Row(
                  children: [
                    Icon(
                      Icons.refresh_rounded,
                      color: white.withOpacity(0.8),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'RESTORE PURCHASES',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white.withOpacity(0.9),
                        fontFamily: font,
                        fontSize: 14.dp,
                        wordSpacing: 1,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
