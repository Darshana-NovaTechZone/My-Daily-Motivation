import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/UI/home/fovorites/settings/settings.dart';
import 'package:my_daily_motivation/UI/home/fovorites/sub_screens/videos.dart';

import 'package:my_daily_motivation/color/color.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../font/font.dart';
import '../../../widget/favorites_msg.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
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
      length: 5,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: Settings(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.settings,
                  color: white,
                  size: 30,
                ))
          ],
          bottom: TabBar(
            indicatorColor: white.withOpacity(0.8),
            unselectedLabelColor: white.withOpacity(0.5),
            automaticIndicatorColorAdjustment: true,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: white.withOpacity(0.9),
            dividerColor: font_gray,
            isScrollable: true,
            tabs: [
              Tab(
                icon: Text(
                  "VIDEOS",
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
                  "PLAYLIST",
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
                  "MUSIC",
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
                  "SPEECHES",
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
                  "QUOTES",
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
            "FAVORITES",
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
          child: TabBarView(
            viewportFraction: 5,
            clipBehavior: Clip.antiAlias,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Videos(),
              FavoriteMSG(
                text: 'playlist',
              ),
              FavoriteMSG(
                text: 'music',
              ),
              FavoriteMSG(
                text: 'speeches',
              ),
              FavoriteMSG(
                text: 'quotes',
              )
            ],
          ),
        ),
      ),
    );
  }
}
