import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/color/color.dart';

import '../../../../font/font.dart';

class SeeAll extends StatefulWidget {
  const SeeAll({super.key});

  @override
  State<SeeAll> createState() => _SeeAllState();
}

class _SeeAllState extends State<SeeAll> {
  ScrollController _controller = ScrollController();
  Color appbarColor = Colors.transparent;
  bool isScroll = false;
  List img = [
    {'img': 'assets/1.PNG', 'text': 'FOCUS'},
    {'img': 'assets/2.PNG', 'text': 'FITNES'},
    {'img': 'assets/3.PNG', 'text': 'DISCIPLINE'},
    {'img': 'assets/4.PNG', 'text': 'WEALTH'},
    {'img': 'assets/5.PNG', 'text': 'HAPPINESS'},
    {'img': 'assets/7.PNG', 'text': 'CONFIDENCE'},
    {'img': 'assets/8.PNG', 'text': 'STRESS & ANXIETY'},
    {'img': 'assets/9.PNG', 'text': 'WAKING UP EARLY'},
    {'img': 'assets/7.PNG', 'text': 'CONFIDENCE'},
    {'img': 'assets/8.PNG', 'text': 'STRESS & ANXIETY'},
    {'img': 'assets/9.PNG', 'text': 'WAKING UP EARLY'},
  ];

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
        notificationPredicate: (notification) {
          if (notification.metrics.pixels > 100) {
            setState(() {
              appbarColor = Colors.black;
              isScroll = true;
            });
          } else {
            setState(() {
              isScroll = false;
              appbarColor = Colors.transparent;
            });
          }
          ;

          return true;
        },
        bottom: isScroll
            ? PreferredSize(
                child: Container(
                  color: white.withOpacity(0.1),
                  width: w,
                  height: 2,
                ),
                preferredSize: Size(w, 2))
            : null,
        surfaceTintColor: black,
        backgroundColor: appbarColor,
        scrolledUnderElevation: 200,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: CircleAvatar(
              backgroundColor: black.withOpacity(0.2),
              child: Icon(
                Icons.arrow_back_ios_rounded,
                color: white,
              ),
            )),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: black.withOpacity(0.2),
                child: Icon(
                  Icons.star_border,
                  color: white,
                ),
              )),
        ],
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            Container(
                foregroundDecoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0, 0.9],
                  ),
                ),
                decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 20)]),
                height: h / 3,
                width: w,
                child: Image.asset(
                  'assets/1.PNG',
                  fit: BoxFit.cover,
                )),
            Text(
              'DAILY MINDSET',
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
            SizedBox(
              height: 10,
            ),
            Text(
              'The boost you need to help you seize the day',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: white.withOpacity(0.9),
                fontFamily: font,
                fontSize: 14.dp,
                wordSpacing: 1,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {},
                  child: Card(
                    color: Color.fromARGB(255, 28, 25, 25),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: white.withOpacity(0.9),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'PLAY ALL',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white.withOpacity(0.9),
                              fontFamily: font,
                              fontSize: 14.dp,
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Card(
                    color: Color.fromARGB(255, 28, 25, 25),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.shuffle,
                            color: white.withOpacity(0.9),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'SHUFFLE',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white.withOpacity(0.9),
                              fontFamily: font,
                              fontSize: 14.dp,
                              wordSpacing: 1,
                              letterSpacing: 1,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              color: Color.fromARGB(255, 34, 30, 30),
            ),
            ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: img.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                img[index]['img'],
                                width: w / 2.2,
                                height: h / 6,
                                fit: BoxFit.cover,
                              )),
                          Container(
                            width: w / 2.2,
                            height: h / 6,
                            decoration: BoxDecoration(color: black.withOpacity(0.6), borderRadius: BorderRadius.circular(10)),
                          ),
                          Positioned(
                              left: 4,
                              top: 4,
                              child: Row(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                                    color: black.withOpacity(0.4),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                      child: Text(
                                        'PRO',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: white,
                                          fontFamily: font,
                                          fontSize: 12.dp,
                                          wordSpacing: 1,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '3:24',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: white,
                                      fontFamily: font,
                                      fontSize: 12.dp,
                                      wordSpacing: 1,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Start Your Day Right',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                              fontFamily: font,
                              fontSize: 14.dp,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Be Inspired',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white.withOpacity(0.9),
                              fontFamily: font,
                              fontSize: 12.dp,
                              wordSpacing: 1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
