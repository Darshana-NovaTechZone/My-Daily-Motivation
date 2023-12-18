import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/font/font.dart';

import '../../color/color.dart';

class MainButton extends StatefulWidget {
  const MainButton({super.key, required this.text, required this.onTap, required this.color, required this.color2});
  final String text;
  final VoidCallback onTap;
  final Color color;
  final Color color2;

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  bool tap = false;
  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTapDown: (_) {
        setState(() {
          tap = true;
        });
      },
      onSecondaryTapDown: (_) {
        setState(() {
          tap = true;
        });
      },
      onSecondaryTapUp: (_) {
        setState(() {
          tap = false;
        });
      },
      onTapUp: (_) {
        setState(() {
          tap = false;
        });
      },
      onTapCancel: () {
        setState(() {
          tap = false;
        });
      },
      onTap: widget.onTap,
      mouseCursor: MouseCursor.defer,
      child: AnimatedOpacity(
        opacity: tap ? 0.2 : 1,
        duration: Duration(milliseconds: 30),
        child: Container(
          alignment: Alignment.center,
          height: h / 14,
          width: w / 1.3,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.color2,
              fontFamily: font,
              fontSize: 17.dp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

}
