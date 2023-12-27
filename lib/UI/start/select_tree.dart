import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:my_daily_motivation/UI/start/select_tow.dart';

import 'package:my_daily_motivation/color/color.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../../font/font.dart';
import '../../provider/all_provider.dart';
import '../unlock/unlock.dart';
import '../widget/mainButton.dart';

class SelectTree extends StatefulWidget {
  const SelectTree({super.key});

  @override
  State<SelectTree> createState() => _SelectTreeState();
}

class _SelectTreeState extends State<SelectTree> {
  List<int> selectedItems = [];
  late VideoPlayerController _controller;
  Timer? _timer;
  int _start = 10;
  late bool _isPlaying = false;
  late double _progressValue = 0.0;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });

    _controller.addListener(() {
      if (_controller.value.isPlaying) {
        setState(() {
          Provider.of<ProviderS>(context, listen: false).progressValue =
              _controller.value.position.inMilliseconds / _controller.value.duration.inMilliseconds;
        });
      }
    });
  }

  void startTimer() {
    Provider.of<ProviderS>(context, listen: false).isTap = true;
    const oneSec = const Duration(seconds: 2);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          print('gggggggggggggggggggg');
          Provider.of<ProviderS>(context, listen: false).isTap = false;
          setState(() {
            timer.cancel();
          });
        } else {
          print('gggggggggggggggggaaaaaaaaaaaggg');
          setState(() {
            _start--;
          });
        }
      },
    );
    print(_timer);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      body: SizedBox(
        height: h,
        width: w,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'WE PICKED A VIDEO JUST FOR YOU',
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
              Spacer(
                flex: 6,
              ),
              Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: background, width: 4)),
                      height: h / 5,
                      width: w / 1.6,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/v.PNG',
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: InkWell(
                      onTap: () {
                        videoPlay();
                        _controller.play();
                      },
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 75,
                        color: white,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'INSTRUCTIONS FOR A \nBAD DAY',
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
              Text(
                'by on Goodgion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: white,
                  fontFamily: Ubuntu,
                  fontSize: 14.dp,
                  wordSpacing: 1,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Spacer(
                flex: 2,
              ),
              MainButton(
                  color: liteBlue,
                  onTap: () {
                    videoPlay();
                    _controller.play();
                  },
                  text: 'WATCH VIDEO',
                  color2: white),
              SizedBox(
                height: 15,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UnlockScreens(isFromStartScreen: true),
                      ));
                },
                child: Text(
                  'EXPLORE APP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white,
                    fontFamily: Ubuntu,
                    fontSize: 15.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              )
            ],
          ),
        ),
      ),
    );
  }

  videoPlay() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showDialog(
        context: context,
        builder: (context) {
          return GestureDetector(
            onTap: () {
              startTimer();
            },
            child: StatefulBuilder(builder: (context, setState) {
              return Consumer<ProviderS>(
                builder: (context, provider, child) => AlertDialog(
                  insetPadding: EdgeInsets.zero,
                  contentPadding: EdgeInsets.zero,
                  content: Container(
                    width: w,
                    height: h,
                    color: black,
                    child: Stack(children: [
                      Center(
                        child: Stack(
                          children: [
                            Center(
                              child: _controller.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio: _controller.value.aspectRatio,
                                      child: VideoPlayer(_controller),
                                    )
                                  : Container(),
                            ),
                            Positioned(
                              top: 0,
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Center(
                                child: CircleAvatar(
                                  backgroundColor: white.withOpacity(0.4),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                      });
                                    },
                                    icon: Icon(
                                      _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      provider.isTap == true
                          ? SizedBox(
                              height: h,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                            backgroundColor: white.withOpacity(0.1),
                                            child: IconButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => UnlockScreens(isFromStartScreen: true),
                                                      ));
                                                },
                                                icon: Icon(
                                                  Icons.expand_more,
                                                  color: white,
                                                ))),
                                        Column(
                                          children: [
                                            Text(
                                              'ALIVE',
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
                                            Text(
                                              'AMMED ISMAL',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: white.withOpacity(0.9),
                                                fontFamily: font,
                                                fontSize: 14.dp,
                                                wordSpacing: 1,
                                                letterSpacing: 1.5,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 35,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${_controller.value.duration.inMinutes.toString().length == 1 ? "0${_controller.value.duration.inMinutes.toString()}" : _controller.value.duration.inMinutes.toString()}:${_controller.value.duration.inSeconds.toString().length == 1 ? "0${_controller.value.duration.inSeconds.toString()}" : _controller.value.duration.inSeconds.toString()}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: white.withOpacity(0.9),
                                            fontFamily: font,
                                            fontSize: 14.dp,
                                            wordSpacing: 1,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "${_controller.value.position.inMinutes.toString().length == 1 ? "0${_controller.value.position.inMinutes.toString()}" : _controller.value.position.inMinutes.toString()}:${_controller.value.position.inSeconds.toString().length == 1 ? "0${_controller.value.position.inSeconds.toString()}" : _controller.value.position.inSeconds.toString()}",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: white.withOpacity(0.9),
                                            fontFamily: font,
                                            fontSize: 14.dp,
                                            wordSpacing: 1,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: LinearProgressIndicator(
                                      backgroundColor: Color.fromARGB(221, 35, 34, 34),
                                      color: white,
                                      value: provider.progressValue,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : SizedBox(
                              height: 100,
                            ),

                      //   Container(
                      //   child: LinearProgressIndicator(
                      //     backgroundColor: Color.fromARGB(221, 35, 34, 34),
                      //     color: white,
                      //     value: isClickSong ? provider.position.inSeconds / provider.duration.inSeconds : 0.1,
                      //   ),
                      // ),
                    ]),
                  ),
                ),
              );
            }),
          );
        });
  }
}
