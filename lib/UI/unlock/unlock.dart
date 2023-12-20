import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/color/color.dart';
import 'package:my_daily_motivation/font/font.dart';

import '../navigation/navigation.dart';
import '../widget/mainButton.dart';

class UnlockScreens extends StatefulWidget {
  UnlockScreens({super.key, required this.isFromStartScreen});
  final bool isFromStartScreen;

  @override
  State<UnlockScreens> createState() => _UnlockScreensState();
}

class _UnlockScreensState extends State<UnlockScreens> {
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        flexibleSpace: Container(
          color: black.withOpacity(0.3),
          height: MediaQuery.of(context).padding.top,
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.close,
            color: white70,
          ),
          onPressed: () {
            if (widget.isFromStartScreen == true) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NavigationScreen(),
                  ));
            } else {
              Navigator.pop(context);
            }
          },
        ),
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: h,
              width: w,
              child: Column(
                children: [
                  SizedBox(
                      height: h / 3,
                      width: w,
                      child: Image.asset(
                        'assets/pexels-kasuma-1785493.jpg',
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: h / 8,
                ),
                Text(
                  'UNLOCK YOUR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white.withOpacity(0.9),
                    fontFamily: font,
                    fontSize: 26.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  'POTENTIAL',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontFamily: font,
                    fontSize: 42.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'with ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white.withOpacity(0.9),
                        fontFamily: font,
                        fontSize: 18.dp,
                        wordSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      'MOTIVATE ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white.withOpacity(0.9),
                        fontFamily: font,
                        fontSize: 18.dp,
                        wordSpacing: 1,
                        // letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
                      color: white,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        child: Text(
                          'PRO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: black,
                            fontFamily: font,
                            fontSize: 16.dp,
                            wordSpacing: 1,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'You get :',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white.withOpacity(0.9),
                        fontFamily: font,
                        fontSize: 18.dp,
                        wordSpacing: 1,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                myRow('Exclusive original speeches'),
                myRow('Thousands of handpicked motivational videos'),
                myRow('5 new videos every day'),
                myRow('Exclusive music for inspiration,energy, relaxation and focus'),
                myRow('Background Play'),
                myRow('Uniquely curated playlists for every mood'),
                myRow('Daily inspirational quotes'),
                myRow("Access ti the world's top mentors"),
                myRow("Ads free"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recurring billing. Cancel anytime.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white.withOpacity(0.9),
                      fontFamily: font,
                      fontSize: 13.dp,
                      wordSpacing: 1,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Rstore Purchases   ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: white.withOpacity(0.9),
                            fontFamily: font,
                            fontSize: 13.dp,
                            wordSpacing: 1,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.circle,
                        color: white.withOpacity(0.9),
                        size: 5,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Terms',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: white.withOpacity(0.9),
                            fontFamily: font,
                            fontSize: 13.dp,
                            wordSpacing: 1,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.circle,
                        color: white.withOpacity(0.9),
                        size: 5,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Privacy Policy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white.withOpacity(0.9),
                              fontFamily: font,
                              fontSize: 13.dp,
                              wordSpacing: 1,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: background, border: Border(top: BorderSide(color: font_gray))),
        width: w,
        // alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Try 7 days for free',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white,
                  fontFamily: font,
                  fontSize: 13.dp,
                  wordSpacing: 1,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MainButton(
                  color: liteBlue,
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => SelectTow(),
                    //     ));
                  },
                  text: 'CONTINUE',
                  color2: white),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '\$9.99 billed yearly after free trial. Cancel\n anytime',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white70,
                  fontFamily: font,
                  fontSize: 13.dp,
                  wordSpacing: 1,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'View all plans',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white,
                  fontFamily: font,
                  fontSize: 13.dp,
                  wordSpacing: 1,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget myRow(
    String test,
  ) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          SizedBox(
            width: w / 7,
          ),
          SizedBox(height: 30, child: Image.asset('assets/icons8-checkmark-64.png')),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              test,
              textAlign: TextAlign.start,
              style: TextStyle(
                color: white.withOpacity(0.9),
                fontFamily: font,
                fontSize: 16.dp,
                wordSpacing: 1,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
