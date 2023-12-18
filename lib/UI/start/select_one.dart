import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/UI/start/select_tow.dart';

import 'package:my_daily_motivation/color/color.dart';

import '../../font/font.dart';
import '../widget/mainButton.dart';

class SelectOne extends StatefulWidget {
  const SelectOne({super.key});

  @override
  State<SelectOne> createState() => _SelectOneState();
}

class _SelectOneState extends State<SelectOne> {
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
              'WHAT BRINGS YOU TO\n MOTIVATE?',
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
                      if (selectedItems.contains(index)) {
                        selectedItems.remove(index);
                      } else {
                        selectedItems.add(index);
                      }
                    });
                  },
                  child: Stack(
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: selectedItems.contains(index) ? Color.fromARGB(255, 0, 179, 255) : background, width: 4)),
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
                      selectedItems.contains(index)
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
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: background, border: Border(top: BorderSide(color: font_gray))),
        width: w,
        height: h / 8,
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: MainButton(
              color: selectedItems.isNotEmpty ? liteBlue : gray,
              onTap: selectedItems.isNotEmpty
                  ? () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectTow(),
                          ));
                    }
                  : () {},
              text: selectedItems.isNotEmpty ? 'NEXT' : 'SELECT ONE',
              color2: selectedItems.isNotEmpty ? white : font_gray),
        ),
      ),
    );
  }
}
