import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

import 'package:my_daily_motivation/color/color.dart';

import '../../../font/font.dart';
import '../../widget/login_button.dart';
import '../../widget/mainButton.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      ),
      backgroundColor: background,
      body: SizedBox(
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'LOG IN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white.withOpacity(0.9),
                      fontFamily: font,
                      fontSize: 32.dp,
                      wordSpacing: 1,
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Log in to your Motivate account",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white.withOpacity(0.8),
                        fontFamily: font,
                        fontSize: 18.dp,
                        wordSpacing: 1,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Icon(Icons.send, color: white.withOpacity(0.5)),
                        border: InputBorder.none,
                        filled: true,
                        hintStyle: TextStyle(color: white.withOpacity(0.5)),
                        hintText: "  Email",
                        fillColor: Color.fromARGB(211, 40, 39, 39),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Icon(Icons.lock, color: white.withOpacity(0.5)),
                        suffixIcon: Icon(Icons.visibility, color: white.withOpacity(0.5)),
                        border: InputBorder.none,
                        filled: true,
                        hintStyle: TextStyle(color: white.withOpacity(0.5)),
                        hintText: "  Password",
                        fillColor: Color.fromARGB(211, 40, 39, 39),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "I forgot my password",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 3, 71, 127),
                          fontFamily: font,
                          fontSize: 18.dp,
                          wordSpacing: 1,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MainButton(
                    color2: white,
                    color: liteBlue,
                    text: 'SIGN UP',
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: white.withOpacity(0.7),
                          fontFamily: font,
                          fontSize: 14.dp,
                          wordSpacing: 1,
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Log in",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 3, 71, 127),
                            fontFamily: font,
                            fontSize: 14.dp,
                            wordSpacing: 1,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
