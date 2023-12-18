import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:my_daily_motivation/color/color.dart';

import '../../../../font/font.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: SizedBox(
            width: w,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    selectOption(),
                    myLiat('MOST POPULAR'),
                    myLiat('FIRST POPULAR'),
                    myLiat('FIRST STEPS'),
                    myLiat('CALM DOWN'),
                    myLiat('OVERCOMING OBSTACLES'),
                    myLiat('BE GREAT '),
                    myLiat('STAY STRONG'),
                    myLiat('VIRTUES')
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget selectOption() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: w / 2.2,
              height: h / 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: liteBlue, width: 3),
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
            1 == 1 ? Positioned(right: 12, top: 12, child: SizedBox(height: 25, child: Image.asset('assets/icons8-check-30.png'))) : SizedBox(),
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Essentials',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white2,
                    fontFamily: 'font',
                    fontSize: 14.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Stack(
          children: [
            Container(
              width: w / 2.2,
              height: h / 6,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: 1 == 2 ? liteBlue : Colors.transparent, width: 3),
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/10.PNG',
                      ),
                      fit: BoxFit.cover)),
            ),
            Container(
              width: w / 2.2,
              height: h / 6,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: black.withOpacity(0.4)),
            ),
            1 == 2 ? Positioned(right: 12, top: 12, child: SizedBox(height: 25, child: Image.asset('assets/icons8-check-30.png'))) : SizedBox(),
            Positioned(
              bottom: 0,
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: white2,
                    ),
                    Text(
                      'Favorites',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white2,
                        fontFamily: 'font',
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
          ],
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }

  Widget myLiat(String text) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 25,
        ),
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
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: h / 5.5,
          child: ListView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Stack(
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
                            child: Card(
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
                            ))
                        : SizedBox(),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text(
                          'Essentials',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: white2,
                            fontFamily: 'font',
                            fontSize: 14.dp,
                            wordSpacing: 1,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
