import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/UI/start/select_tree.dart';

import 'package:my_daily_motivation/color/color.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../font/font.dart';
import '../../provider/all_provider.dart';
import '../widget/mainButton.dart';

class SelectTow extends StatefulWidget {
  const SelectTow({super.key});

  @override
  State<SelectTow> createState() => _SelectTowState();
}

class _SelectTowState extends State<SelectTow> {
  int selectedItems = 100;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController = ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();
  List hours = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List min = [00];
  List minn = new List<int>.generate(60, (i) => i + 1);
  int selectedHours = 0;
  int selectedMin = 0;
  int isPm = 0;

  String time = '';

  List img = [
    {'img': 'assets/1.PNG', 'text': 'WAKING UP', 'time': '7:00 AM'},
    {'img': 'assets/2.PNG', 'text': 'BREAKFAST', 'time': '7:30 AM'},
    {'img': 'assets/3.PNG', 'text': 'MY COMMUTE', 'time': '8:00 AM'},
    {'img': 'assets/4.PNG', 'text': 'AT WORK', 'time': '2:00 PM'},
    {'img': 'assets/5.PNG', 'text': 'BEFORE STUDYING', 'time': '8:00 PM'},
    {'img': 'assets/7.PNG', 'text': 'THE GYM', 'time': '6:00 PM'},
    {'img': 'assets/8.PNG', 'text': 'LUNCH BREAK', 'time': '12:00 PM'},
    {'img': 'assets/9.PNG', 'text': 'BEFORE BED', 'time': '11:00 PM'},
  ];
  ScrollController _controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      min.addAll(minn);
      print(min);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Consumer<ProviderS>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: background,
          automaticallyImplyLeading: false,
          centerTitle: true,
          toolbarHeight: 100,
          bottom: PreferredSize(
            child: Container(
              width: w / 1.3,
              height: 1,
              color: font_gray,
            ),
            preferredSize: Size(w, 5),
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: w,
              child: Text(
                'WHEN DO YOU NEED\nMOTIVATION?',
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
            ),
          ),
        ),
        backgroundColor: background,
        body: SizedBox(
          height: h,
          width: w,
          child: SingleChildScrollView(
            controller: _controller,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: h / 6),
              itemCount: img.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(7),
                    onTap: () {
                      setState(() {
                        selectedItems = index;
                        time = img[index]['time'];
                        var myTime = time.substring(0, time.length - 2);
                        print(time);
                        var splited = myTime.split(':');
                        int hour = int.parse(splited[0]);
                        int minute = int.parse(splited[1]);
                        var newString = time.substring(time.length - 2);
                        print(newString);
                        setState(() {
                          selectedHours = hour - 1;
                          selectedMin = minute;
                          if (newString == "PM") {
                            Provider.of<ProviderS>(context, listen: false).isPm = isPm = 1;
                          } else {
                            Provider.of<ProviderS>(context, listen: false).isPm = isPm = 2;
                          }
                        });
                        print(hour);
                        print(minute);

                        Provider.of<ProviderS>(context, listen: false).selectedHours = selectedHours;
                        Provider.of<ProviderS>(context, listen: false).selectedMin = selectedMin;
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: selectedItems == index ? Color.fromARGB(255, 0, 179, 255) : background, width: 4)),
                            height: h / 6,
                            width: w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(7),
                              child: Image.asset(
                                img[index]['img'],
                                fit: BoxFit.cover,
                              ),
                            )),
                        Container(
                          height: h / 6,
                          width: w,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(7), color: black.withOpacity(0.4)),
                        ),
                        selectedItems == index
                            ? Positioned(right: 12, top: 12, child: SizedBox(height: 25, child: Image.asset('assets/icons8-check-30.png')))
                            : SizedBox(),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              img[index]['text'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: white,
                                fontFamily: Ubuntu,
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
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(color: background, border: Border(top: BorderSide(color: font_gray))),
              width: w,
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  selectedItems != 100
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "We'll remind you at",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: white,
                                fontFamily: font,
                                fontSize: 14.dp,
                                wordSpacing: 1,
                                letterSpacing: 1.5,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                var myTime = time.substring(0, time.length - 2);
                                print(time);
                                var splited = myTime.split(':');
                                int hour = int.parse(splited[0]);
                                int minute = int.parse(splited[1]);
                                var newString = time.substring(time.length - 2);
                                print(newString);
                                setState(() {
                                  selectedHours = hour - 1;
                                  selectedMin = minute;
                                  if (newString == "PM") {
                                    Provider.of<ProviderS>(context, listen: false).isPm = isPm = 1;
                                  } else {
                                    Provider.of<ProviderS>(context, listen: false).isPm = isPm = 2;
                                  }
                                });
                                print(hour);
                                print(minute);
                                changeTime();

                                Provider.of<ProviderS>(context, listen: false).selectedHours = selectedHours;
                                Provider.of<ProviderS>(context, listen: false).selectedMin = selectedMin;
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                color: font_gray,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                  child: Text(
                                    "${provider.selectedHours.toString().length == 1 ? '0${provider.selectedHours}' : '${provider.selectedHours}'}:${provider.selectedMin.toString().length == 1 ? '0${provider.selectedMin}' : '${provider.selectedMin}'} ${provider.isPm == 1 ? 'PM' : 'AM'}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: white,
                                      fontFamily: font,
                                      fontSize: 14.dp,
                                      wordSpacing: 1,
                                      letterSpacing: 1.5,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : SizedBox(),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MainButton(
                        color: selectedItems != 100 ? liteBlue : gray,
                        onTap: selectedItems != 100
                            ? () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SelectTree(),
                                    ));
                              }
                            : () {},
                        text: selectedItems != 100 ? 'NEXT' : 'SELECT ONE',
                        color2: selectedItems != 100 ? white : font_gray),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeTime() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    showModalBottomSheet(
        showDragHandle: true,
        backgroundColor: darkBrown,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, SetState) {
            return Consumer<ProviderS>(
              builder: (context, provider, child) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: h / 3,
                    child: Row(
                      children: [
                        Expanded(
                          child: ScrollablePositionedList.builder(
                            initialScrollIndex: provider.selectedHours,
                            itemCount: hours.length,
                            itemBuilder: (context, index) {
                              print(Provider.of<ProviderS>(context, listen: false).selectedHours);
                              return InkWell(
                                onTap: () {
                                  SetState(() {
                                    Provider.of<ProviderS>(context, listen: false).selectedHours = index;
                                    selectedHours = index;
                                    print(selectedHours);
                                  });
                                },
                                child: SizedBox(
                                  width: w / 5,
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    color: provider.selectedHours == index ? liteBlue : font_gray,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                      child: Text(
                                        hours[index].toString(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: white,
                                          fontFamily: font,
                                          fontSize: 14.dp,
                                          wordSpacing: 1,
                                          letterSpacing: 1.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemScrollController: itemScrollController,
                            scrollOffsetController: scrollOffsetController,
                            itemPositionsListener: itemPositionsListener,
                            scrollOffsetListener: scrollOffsetListener,
                          ),
                        ),
                        Expanded(
                          child: ScrollablePositionedList.builder(
                            initialScrollIndex: provider.selectedMin,
                            itemCount: min.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                SetState(() {
                                  Provider.of<ProviderS>(context, listen: false).selectedMin = index;
                                  print(Provider.of<ProviderS>(context, listen: false).selectedMin);
                                });
                              },
                              child: SizedBox(
                                width: w / 5,
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  color: provider.selectedMin == index ? liteBlue : font_gray,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                                    child: Text(
                                      min[index].toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: white,
                                        fontFamily: font,
                                        fontSize: 14.dp,
                                        wordSpacing: 1,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    SetState(() {
                                      isPm = 1;
                                    });
                                    Provider.of<ProviderS>(context, listen: false).isPm = 1;
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    color: provider.isPm == 1 ? liteBlue : font_gray,
                                    child: SizedBox(
                                      width: w / 4,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                        child: Text(
                                          'PM',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: white,
                                            fontFamily: font,
                                            fontSize: 14.dp,
                                            wordSpacing: 1,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    SetState(() {
                                      isPm = 2;
                                    });
                                    Provider.of<ProviderS>(context, listen: false).isPm = 2;
                                  },
                                  child: Card(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                    color: provider.isPm == 2 ? liteBlue : font_gray,
                                    child: SizedBox(
                                      width: w / 4,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                        child: Text(
                                          'AM',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: white,
                                            fontFamily: font,
                                            fontSize: 14.dp,
                                            wordSpacing: 1,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MainButton(
                        color: liteBlue,
                        onTap: () {
                          Provider.of<ProviderS>(context, listen: false).selectedHours;
                          Provider.of<ProviderS>(context, listen: false).selectedMin;
                          Provider.of<ProviderS>(context, listen: false).isPm = isPm;
                          Navigator.pop(context);
                        },
                        text: 'SELECT ONE',
                        color2: white),
                  ),
                ],
              ),
            );
          });
        });
  }
}
