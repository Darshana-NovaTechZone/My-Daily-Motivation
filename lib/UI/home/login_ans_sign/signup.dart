import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/UI/navigation/navigation.dart';

import 'package:my_daily_motivation/color/color.dart';
import 'package:page_transition/page_transition.dart';

import '../../../class/email_validate.dart';
import '../../../font/font.dart';
import '../../widget/login_button.dart';
import '../../widget/mainButton.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isViable = true;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isValid = false;
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
                    'SIGN UP',
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
                      "Sign up  with your email address",
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
                    child: TextField(
                      style: TextStyle(color: white),
                      controller: name,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Icon(Icons.person, color: white.withOpacity(0.5)),
                        border: InputBorder.none,
                        filled: true,
                        hintStyle: TextStyle(color: white.withOpacity(0.5)),
                        hintText: "  Your Name",
                        fillColor: Color.fromARGB(211, 40, 39, 39),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    child: TextField(
                      controller: email,
                      style: TextStyle(color: white),
                      onChanged: (value) {
                        setState(() {
                          _isValid = EmailVal().isValidEmail(value!);
                        });
                      },
                      decoration: InputDecoration(
                        errorText: _isValid ? "" : "enter valid email",
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
                      controller: password,
                      style: TextStyle(color: white),
                      obscureText: isViable,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        prefixIcon: Icon(Icons.lock, color: white.withOpacity(0.5)),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isViable = !isViable;
                              });
                            },
                            icon: Icon(isViable ? Icons.visibility_off : Icons.visibility, color: white.withOpacity(0.5))),
                        border: InputBorder.none,
                        filled: true,
                        hintStyle: TextStyle(color: white.withOpacity(0.5)),
                        hintText: "  Password",
                        fillColor: Color.fromARGB(211, 40, 39, 39),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RichText(
                    softWrap: true,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "By continuing you agree to Motivate's  ",
                          style: TextStyle(
                            color: white.withOpacity(0.8),
                            fontFamily: font,
                            fontSize: 12.dp,
                            wordSpacing: 1,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextSpan(
                          onEnter: (event) {
                            print('ddddd');
                          },
                          text: 'Terms',
                          style: TextStyle(
                            color: Colors.blue,
                            fontFamily: font,
                            fontSize: 12.dp,
                            wordSpacing: 1,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  MainButton(
                    color2: white,
                    color: liteBlue,
                    text: 'SIGN UP',
                    onTap: () {
                      if (password.text.isNotEmpty) {
                        if (_isValid) {
                          if (password.text.isNotEmpty) {
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavigationScreen(),
                                ),
                                (route) => false);
                          } else {
                            EmailVal().msg(context, "Enter password");
                          }
                        } else {
                          EmailVal().msg(context, "Enter valid email");
                        }
                      } else {
                        EmailVal().msg(context, "Enter name");
                      }
                    },
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: Login(),
                            ),
                          );
                        },
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
