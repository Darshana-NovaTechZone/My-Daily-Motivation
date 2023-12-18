import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/UI/start/select_tow.dart';

import 'package:my_daily_motivation/color/color.dart';

import '../../font/font.dart';
import '../unlock/unlock.dart';
import '../widget/mainButton.dart';

class SelectTree extends StatefulWidget {
  const SelectTree({super.key});

  @override
  State<SelectTree> createState() => _SelectTreeState();
}

class _SelectTreeState extends State<SelectTree> {
  List<int> selectedItems = [];
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
  ScrollController _controller = ScrollController();
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
      body: SizedBox(
        height: h,
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'WE PICKED A VIDEO JUST FOR YOU',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white,
                  fontFamily: Ubuntu,
                  fontSize: 26.dp,
                  wordSpacing: 1,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(
                flex: 6,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: background, width: 4)),
                      height: h / 5,
                      width: w / 1.6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/v.PNG',
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Icon(
                      Icons.play_arrow_rounded,
                      size: 75,
                      color: white,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'INSTRUCTIONS FOR A \nBAD DAY',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white,
                  fontFamily: Ubuntu,
                  fontSize: 26.dp,
                  wordSpacing: 1,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'by on Goodgion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white,
                  fontFamily: Ubuntu,
                  fontSize: 14.dp,
                  wordSpacing: 1,
                  letterSpacing: 1.5,
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
                          builder: (context) => SelectTow(),
                        ));
                  },
                  text: 'WATCH VIDEO',
                  color2: white),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Unlock(),
                      ));
                },
                child: Text(
                  'EXPLORE APP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontFamily: Ubuntu,
                    fontSize: 15.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
