import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:my_daily_motivation/color/color.dart';

import '../../../font/font.dart';
import '../../unlock/unlock.dart';
import 'see_all/see_all.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  ScrollController _controller = ScrollController();
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
      backgroundColor: background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          SizedBox(
              height: h + 10,
              width: w,
              child: Image.asset(
                'assets/d.PNG',
                fit: BoxFit.cover,
              )),
          SingleChildScrollView(
            controller: _controller,
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: h / 15,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        filled: true,
                        hintStyle: TextStyle(color: white),
                        hintText: "Search",
                        fillColor: Color.fromARGB(212, 18, 18, 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: h / 6,
                ),
                Text(
                  'DISCOVER',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontFamily: font,
                    fontSize: 32.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'See everything that Motivate has to offer \nFind what motivates you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white.withOpacity(0.8),
                    fontFamily: font,
                    fontSize: 12.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(color: black, boxShadow: [
                    BoxShadow(
                      blurRadius: 20,
                      spreadRadius: 10,
                    )
                  ]),
                  child: Column(
                    children: [
                      firstLis(),
                      myList('MIND OVER MATTER', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeeAll(),
                            ));
                      }),
                      myList('MORNING COMMUTE', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeeAll(),
                            ));
                      }),
                      myList('PLAYLIST', () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SeeAll(),
                            ));
                      }),
                      seconList(),
                      thirdList(),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  thirdList() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            'CATEGORIES',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: white,
              fontFamily: 'font',
              fontSize: 18.dp,
              wordSpacing: 1,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
            child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UnlockScreens(isFromStartScreen: false),
                    ));
              },
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset(
                        img[index]['img'],
                        width: w,
                        height: h / 8,
                        fit: BoxFit.cover,
                      )),
                  Container(
                    width: w,
                    height: h / 8,
                    decoration: BoxDecoration(color: black.withOpacity(0.6), borderRadius: BorderRadius.circular(5)),
                  ),
                  Positioned(
                      left: 15,
                      bottom: 0,
                      top: 0,
                      child: Center(
                        child: Text(
                          'ESSENTIALS',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: white,
                            fontFamily: font,
                            fontSize: 14.dp,
                            wordSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        )),
      ],
    );
  }

  seconList() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'PLAYLIST',
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: white,
                  fontFamily: 'font',
                  fontSize: 18.dp,
                  wordSpacing: 1,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Text(
                  'See All',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: white,
                    fontFamily: 'See All',
                    fontSize: 14.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
            height: h / 3,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: img.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UnlockScreens(isFromStartScreen: false),
                        ));
                  },
                  child: Stack(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            img[index]['img'],
                            width: w / 2.2,
                            height: h / 3,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        width: w / 2.2,
                        height: h / 3,
                        decoration: BoxDecoration(color: black.withOpacity(0.6), borderRadius: BorderRadius.circular(10)),
                      ),
                      Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          top: 0,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'WAKE UP EARLY',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: font,
                                    fontSize: 14.dp,
                                    wordSpacing: 1,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  color: gray,
                                  height: 3,
                                  width: w / 8,
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }

  firstLis() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
        height: h / 3,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: img.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UnlockScreens(isFromStartScreen: false),
                    ));
              },
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        img[index]['img'],
                        width: w / 2.2,
                        height: h / 3,
                        fit: BoxFit.cover,
                      )),
                  Container(
                    width: w / 2.2,
                    height: h / 3,
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
                  SizedBox(
                    width: w / 2.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'MOTIVATE',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: white,
                                fontFamily: font,
                                fontSize: 12.dp,
                                wordSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                              color: liteBlue.withOpacity(0.9),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                                child: Text(
                                  'ORIGINAL',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: white,
                                    fontFamily: font,
                                    fontSize: 8.dp,
                                    wordSpacing: 1,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'OVERCOMING\nFOMO',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: white,
                            fontFamily: font,
                            fontSize: 14.dp,
                            wordSpacing: 1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'PATRICK MGGINNIS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white.withOpacity(0.8),
                              fontFamily: font,
                              fontSize: 10.dp,
                              wordSpacing: 3,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget myList(String text, VoidCallback onTap) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: white,
                  fontFamily: 'font',
                  fontSize: 18.dp,
                  wordSpacing: 1,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  'See All',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: white,
                    fontFamily: 'See All',
                    fontSize: 14.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: h / 4,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UnlockScreens(isFromStartScreen: false),
                        ));
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: w / 2.2,
                            height: h / 6,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/8.PNG',
                                    ),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: w / 2.2,
                            height: h / 6,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: black.withOpacity(0.4)),
                          ),
                          1 == 1
                              ? Positioned(
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
                                        '6:09',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: white,
                                          fontFamily: font,
                                          fontSize: 12.dp,
                                          wordSpacing: 1,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ))
                              : SizedBox(),
                        ],
                      ),
                      Text(
                        'Change Your Life',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: white2,
                          fontFamily: 'font',
                          fontSize: 14.dp,
                          wordSpacing: 1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'RedFrost Motivation',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontFamily: 'font',
                          fontSize: 14.dp,
                          wordSpacing: 1,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
