import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:my_daily_motivation/color/color.dart';

import '../../../../font/font.dart';
import 'categories.dart';
import 'themes.dart';

class QuotesThemes extends StatefulWidget {
  const QuotesThemes({super.key});

  @override
  State<QuotesThemes> createState() => _QuotesThemesState();
}

class _QuotesThemesState extends State<QuotesThemes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: CircleAvatar(
                    backgroundColor: white.withOpacity(0.1),
                    child: Icon(
                      Icons.expand_more,
                      color: white,
                    )))
          ],
          bottom: TabBar(
            indicatorColor: white.withOpacity(0.8),
            unselectedLabelColor: white.withOpacity(0.5),
            automaticIndicatorColorAdjustment: true,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: white.withOpacity(0.9),
            dividerColor: font_gray,
            tabs: [
              Tab(
                icon: Text(
                  "CATEGORIES",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: font,
                    fontSize: 14.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Tab(
                icon: Text(
                  "THEMES",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
          title: Text(
            "QUOTES",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: white.withOpacity(0.8),
              fontFamily: font,
              fontSize: 32.dp,
              wordSpacing: 1,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/sky.PNG'))),
          child: TabBarView(
            children: [Categories(), Themes()],
          ),
        ),
      ),
    );
  }
}
