import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/color/color.dart';
import 'package:my_daily_motivation/font/font.dart';
import 'package:provider/provider.dart';

import '../../db/sqldb.dart';
import '../../provider/all_provider.dart';
import '../start/get_start.dart';
import '../widget/mainButton.dart';

class SplashSecond extends StatefulWidget {
  const SplashSecond({super.key});

  @override
  State<SplashSecond> createState() => _SplashSecondState();
}

class _SplashSecondState extends State<SplashSecond> {
  SqlDb sqlDb = SqlDb();
  @override
  void initState() {
    localData();
    Future.delayed(Duration(seconds: 3)).then((value) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetStart(),
        )));
    // TODO: implement initState
    super.initState();
  }

  localData() async {
    List res = await SqlDb().readData('select * from theme');

    if (res.isEmpty) {
      await SqlDb().insertData('insert into theme ("img","status","index") values("","0","500")');

      Provider.of<ProviderS>(context, listen: false).status = 0;
      Provider.of<ProviderS>(context, listen: false).imgName = '';
      Provider.of<ProviderS>(context, listen: false).themeIndex = 500;
    } else {
      Provider.of<ProviderS>(context, listen: false).status = res[0]['status'];
      Provider.of<ProviderS>(context, listen: false).imgName = res[0]['img'];
      Provider.of<ProviderS>(context, listen: false).themeIndex = res[0]['index'];
    }
    print(res);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      body: Center(
          child: SizedBox(
              height: h / 6,
              child: Text(
                'MOTIVATE',
                style: TextStyle(color: white, fontFamily: font, fontSize: 32.dp, fontWeight: FontWeight.bold, letterSpacing: 15),
              ))),
    );
  }
}
