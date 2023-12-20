import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/UI/widget/mainButton.dart';
import 'package:my_daily_motivation/color/color.dart';
import 'package:provider/provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../font/font.dart';
import '../../../provider/all_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  int selectedItems = 100;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController = ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener = ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener = ScrollOffsetListener.create();
  List hours = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12];
  List min = [00];
  List minn = new List<int>.generate(60, (i) => i + 1);
  List count = new List<int>.generate(5, (i) => i + 1);
  int selectedHours = 0;
  int selectedMin = 0;
  int isPm = 0;

  String time = '6:00';
  @override
  void initState() {
    setState(() {
      min.addAll(minn);

      print(min);
    });
    // TODO: implement initState
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((_) {
      // add your code here.

      Provider.of<ProviderS>(context, listen: false).selectedHours = 6;
      Provider.of<ProviderS>(context, listen: false).selectedMin = 6;
      Provider.of<ProviderS>(context, listen: false).isPm = 1;
    });
  }

  bool quote = false;
  bool remind = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Consumer<ProviderS>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: CircleAvatar(
                  backgroundColor: white.withOpacity(0.1),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: white,
                  ))),
          centerTitle: true,
          title: Text(
            'NOTIFICATION',
            style: TextStyle(
              color: white,
              fontFamily: font,
              fontSize: 14.dp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        backgroundColor: background,
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'INSPIRING QUOTES',
                      style: TextStyle(
                        color: white,
                        fontFamily: font,
                        fontSize: 18.dp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(
                      activeColor: liteBlue,
                      value: quote,
                      onChanged: (value) {
                        setState(() {
                          quote = value;
                        });
                      },
                    )
                  ],
                ),
                Text(
                  'Stay motivated with a variety of inspirational quotes delivered right to your phone',
                  style: TextStyle(
                    color: white,
                    fontFamily: font,
                    fontSize: 18.dp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Get a quote',
                      style: TextStyle(
                        color: white,
                        fontFamily: font,
                        fontSize: 17.dp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          getQuote();
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          color: Color.fromARGB(208, 58, 57, 57),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                            child: Text(
                              "${provider.count + 1}",
                              style: TextStyle(
                                color: white,
                                fontFamily: font,
                                fontSize: 17.dp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'times a day',
                      style: TextStyle(
                        color: white,
                        fontFamily: font,
                        fontSize: 17.dp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color.fromARGB(208, 58, 57, 57),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'INSPIRING QUOTES',
                      style: TextStyle(
                        color: white,
                        fontFamily: font,
                        fontSize: 18.dp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Switch(
                      activeColor: liteBlue,
                      value: quote,
                      onChanged: (value) {
                        setState(() {
                          quote = value;
                        });
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Set a reminder to help you stay motivated daily.',
                  style: TextStyle(
                    color: white,
                    fontFamily: font,
                    fontSize: 18.dp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "We'll  remind you at ",
                      style: TextStyle(
                        color: white,
                        fontFamily: font,
                        fontSize: 17.dp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: InkWell(
                        onTap: () {
                          changeTime();
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                          color: Color.fromARGB(208, 58, 57, 57),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                            child: Text(
                              "${provider.selectedHours.toString().length == 1 ? '0${provider.selectedHours}' : ''}:${provider.selectedMin.toString().length == 1 ? '0${provider.selectedMin}' : ''} ${provider.isPm == 1 ? 'PM' : 'AM'}",
                              style: TextStyle(
                                color: white,
                                fontFamily: font,
                                fontSize: 17.dp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  color: Color.fromARGB(208, 58, 57, 57),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'PUSH NOTIFICATIONS',
                  style: TextStyle(
                    color: white,
                    fontFamily: font,
                    fontSize: 18.dp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'You can manage push notifications like New Content notifications and Announcements in app settings',
                  style: TextStyle(
                    color: white,
                    fontFamily: font,
                    fontSize: 18.dp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: MainButton(text: 'MANAGE SETTINGS', onTap: () {}, color: Color.fromARGB(208, 58, 57, 57), color2: white),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getQuote() {
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
                  Container(
                    alignment: Alignment.center,
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: count.length,
                      itemBuilder: (context, index) => Container(
                        width: w / 5,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(100),
                            onTap: () {
                              Provider.of<ProviderS>(context, listen: false).count = index;
                              SetState(() {});
                            },
                            child: CircleAvatar(
                              backgroundColor: provider.count == index ? liteBlue : Colors.transparent,
                              child: Text(
                                count[index].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: white,
                                  fontSize: 22.dp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: MainButton(
                        color: liteBlue,
                        onTap: () {
                          Provider.of<ProviderS>(context, listen: false).selectedHours = selectedHours;
                          Provider.of<ProviderS>(context, listen: false).selectedMin = selectedMin;

                          Navigator.pop(context);
                        },
                        text: 'SET AMOUNT',
                        color2: white),
                  ),
                ],
              ),
            );
          });
        });
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
                            initialScrollIndex: selectedHours,
                            itemCount: hours.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                SetState(() {
                                  selectedHours = index;
                                  print(selectedHours);
                                });
                              },
                              child: SizedBox(
                                width: w / 5,
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  color: selectedHours == index ? liteBlue : font_gray,
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
                            ),
                            itemScrollController: itemScrollController,
                            scrollOffsetController: scrollOffsetController,
                            itemPositionsListener: itemPositionsListener,
                            scrollOffsetListener: scrollOffsetListener,
                          ),
                        ),
                        Expanded(
                          child: ScrollablePositionedList.builder(
                            initialScrollIndex: selectedMin,
                            itemCount: min.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                SetState(() {
                                  selectedMin = index;
                                  print(selectedMin);
                                });
                              },
                              child: SizedBox(
                                width: w / 5,
                                child: Card(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                  color: selectedMin == index ? liteBlue : font_gray,
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
                          Provider.of<ProviderS>(context, listen: false).selectedHours = selectedHours;
                          Provider.of<ProviderS>(context, listen: false).selectedMin = selectedMin;
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
