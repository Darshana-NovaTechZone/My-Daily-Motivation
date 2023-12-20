import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:my_daily_motivation/color/color.dart';

import '../../../../font/font.dart';
import '../../../../widget/favorites_msg.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

class _VideosState extends State<Videos> {
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
      body: Center(
          child: SizedBox(
              child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FavoriteMSG(
          
            text: 'videos',
          )
        ],
      ))),
    );
  }
}
