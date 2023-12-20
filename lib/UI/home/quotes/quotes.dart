import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/UI/home/quotes/Qutes_theme/quotes_theme.dart';

import 'package:my_daily_motivation/color/color.dart';
import 'package:page_transition/page_transition.dart';

import '../../../font/font.dart';
import '../login_ans_sign/login_landing.dart';

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
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
      backgroundColor: background,
      body: Stack(
        children: [
          Container(
              child: CarouselSlider.builder(
            itemCount: images.length,
            options: CarouselOptions(autoPlay: false, aspectRatio: 2.0, viewportFraction: 1, enlargeCenterPage: true, height: h),
            itemBuilder: (context, index, realIdx) {
              return Stack(
                children: [
                  Container(
                    child: Center(
                        child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                      width: w,
                      height: h,
                    )),
                  ),
                  Container(
                    width: w,
                    height: h,
                    color: black.withOpacity(0.5),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Seventy percent of success in life is showing up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                              fontFamily: font,
                              fontSize: 26.dp,
                              wordSpacing: 1,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Woody Allen",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white.withOpacity(0.9),
                              fontFamily: font,
                              fontSize: 14.dp,
                              wordSpacing: 1,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          )),
          Positioned(
            bottom: 100,
            right: 0,
            left: 0,
            child: SizedBox(
              width: w,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: QuotesThemes(),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.grid_view_rounded,
                              color: white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Essentials",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: white,
                                fontFamily: font,
                                fontSize: 12.dp,
                                wordSpacing: 1,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        height: 40,
                        decoration: BoxDecoration(color: black.withOpacity(0.7), borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        share('Seventy percent of success in life is showing up');
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.share_outlined,
                            color: white,
                          ),
                        ),
                        decoration: BoxDecoration(color: black.withOpacity(0.7), shape: BoxShape.circle),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.bottomToTop,
                            child: LoginLanding(),
                          ),
                        );
                      },
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.star_border,
                            color: white,
                          ),
                        ),
                        decoration: BoxDecoration(color: black.withOpacity(0.7), shape: BoxShape.circle),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> share(String text) async {
    await FlutterShare.share(title: 'Daily Motivation', text: text, linkUrl: 'https://www.novatechzone.com/', chooserTitle: 'Example Chooser Title');
  }
}
