import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:my_daily_motivation/color/color.dart';

import '../../../../font/font.dart';

class Themes extends StatefulWidget {
  const Themes({super.key});

  @override
  State<Themes> createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  int selectedIndex = 500;
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: background,
        body: SingleChildScrollView(
          controller: _controller,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              ///ccc
              InkWell(
                onTap: () {
                  setState(() {
                    selectedIndex = 500;
                  });
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                          height: h / 9,
                          width: w,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              'assets/3.PNG',
                              fit: BoxFit.fitWidth,
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: h / 9,
                        width: w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: selectedIndex == 500 ? liteBlue : Colors.transparent, width: 3),
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/3.PNG',
                                ),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    selectedIndex == 500
                        ? Positioned(
                            right: 20,
                            top: 20,
                            child: SizedBox(
                                height: 25,
                                child: Image.asset(
                                  'assets/icons8-check-30.png',
                                  fit: BoxFit.cover,
                                )))
                        : SizedBox(),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 20,
                      child: Center(
                        child: Text(
                          "Handpicked images",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: white,
                            fontFamily: font,
                            fontSize: 18.dp,
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
              SizedBox(
                height: 25,
              ),
              Text(
                'STILL IMAGES',
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
                height: 25,
              ),
              SizedBox(
                width: w,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 50,
                  padding: EdgeInsets.all(0),
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 8, mainAxisExtent: h / 4),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: w / 2.2,
                          height: h / 4,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: selectedIndex == index ? liteBlue : Colors.transparent, width: 3),
                              image: DecorationImage(
                                  image: AssetImage(
                                    'assets/8.PNG',
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        Container(
                          width: w / 2.2,
                          height: h / 4,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: black.withOpacity(0.4)),
                        ),
                        selectedIndex == index
                            ? Positioned(
                                right: 12,
                                top: 12,
                                child: SizedBox(
                                    height: 25,
                                    child: Image.asset(
                                      'assets/icons8-check-30.png',
                                      fit: BoxFit.cover,
                                    )))
                            : SizedBox(),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
