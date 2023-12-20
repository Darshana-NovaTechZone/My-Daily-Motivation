import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:my_daily_motivation/color/color.dart';

import '../home/discover/discover.dart';
import '../home/fovorites/favorites.dart';
import '../home/home.dart';
import '../home/music/music.dart';
import '../home/music/play.dart';
import '../home/quotes/quotes.dart';
import '../home/ytc.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
List imglist = [
  'assets/j1.jpg',
  'assets/j2.jpg',
  'assets/j3.jpg',
  'assets/j4.jpg',
  'assets/j.jpg',
];

class _NavigationScreenState extends State<NavigationScreen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  bool iconSize1 = false;
  bool iconSize2 = false;
  bool iconSize3 = false;
  late AudioPlayer player;
  AnimationController? _controller;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Tween<double> _tween = Tween(begin: 0.75, end: 2);
  static List<Widget> _pages = <Widget>[Home(), Discover(), Music(), Quotes(), Favorites()];
  void _onItemTapped(int index) {
    print(index);
    log('ffff');
    if (index == 2) {
    } else {
      player.stop();
      player.dispose();
    }

    setState(() {
      _selectedIndex = index;
      log(_selectedIndex.toString());
    });
  }

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    _controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    _controller!.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        extendBody: true,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: navColor,
          // unselectedLabelStyle: TextStyle(fontSize: 11.sp),
          landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
          unselectedIconTheme: IconThemeData(
            color: navUnselectColor,
          ),
          unselectedItemColor: navUnselectColor,
          selectedIconTheme: IconThemeData(
            color: white,
          ),
          selectedItemColor: white,
          onTap: _onItemTapped,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25.dp,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.explore,
                fill: 0.5,
                size: 25.dp,
              ),
              label: 'DISCOVER',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.library_music_sharp,
                fill: 0.5,
                size: 25.dp,
              ),
              label: 'MUSIC',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.format_quote_sharp,
                fill: 0.5,
                size: 26.dp,
              ),
              label: 'QUOTES',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
                size: 25.dp,
              ),
              label: 'FAVORITES',
            ),
          ],
        ),

        // bottomNavigationBar: BottomAppBar(),

        // drawer: CustomDrawer(),
        body: SizedBox(
          // height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: _pages.elementAt(_selectedIndex), //New
                ),
              ),
            ],
          ),
        ));
  }
}
