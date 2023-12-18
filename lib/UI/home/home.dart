import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:gif_view/gif_view.dart';

import 'package:my_daily_motivation/color/color.dart';
import 'package:my_daily_motivation/font/font.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;
  ScrollController _scrollController = ScrollController();
  List gif = [
    {'text': 'WHY ONLY 1% SUCCEED', 'text2': 'BE INSPIRED', 'time': '6.34'},
    {'text': 'FEEDOM', 'text2': 'RSD MOTIVATE', 'time': '6.34'},
    {'text': 'tHE BILLIONAIRE CLUB', 'text2': 'BASQUIAT PICASSO', 'time': '6.34'},
    {'text': 'WHY ONLY 1% SUCCEED', 'text2': 'BE INSPIRED', 'time': '6.34'},
    {'text': 'WHY ONLY 1% SUCCEED', 'text2': 'BE INSPIRED', 'time': '6.34'},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // _controller.videoPlayerOptions;
        // _controller.value.duration;
        // _controller.value.isLooping;
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: background,
      body: Center(
          child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            // _controller.value.isInitialized
            //     ? AspectRatio(
            //         aspectRatio: _controller.value.aspectRatio,
            //         child: VideoPlayer(_controller),
            //       )
            //     : Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 35,
                ),
                Text(
                  "THURSDAY'S  ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: white.withOpacity(0.8),
                    fontFamily: font,
                    fontSize: 18.dp,
                    wordSpacing: 1,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "LATEST",
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
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: gif.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GifView.asset(
                        'assets/ezgif.com-optimize.gif',
                        height: h / 2.2,
                        width: h,
                        frameRate: 30 + index, // default is 15 FPS
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: h / 2.2,
                      width: h,
                      color: black.withOpacity(0.6),
                    ),
                    Positioned(
                      bottom: 0,
                      top: 0,
                      right: 0,
                      left: 0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            gif[index]['text'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                              fontFamily: font,
                              fontSize: 25.dp,
                              wordSpacing: 1,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            gif[index]['text2'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white.withOpacity(0.7),
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
                    Positioned(
                      bottom: 5,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.share_outlined,
                                  color: white,
                                )),
                            Text(
                              gif[index]['time'],
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
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.star_border,
                                  color: white,
                                )),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        color: font_gray,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'PRO',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: white,
                              fontFamily: font,
                              fontSize: 12.dp,
                              wordSpacing: 1,
                              letterSpacing: 1.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            Text(
              "CHECK BACK IN ",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: white.withOpacity(0.8),
                fontFamily: font,
                fontSize: 18.dp,
                wordSpacing: 1,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "TOMORROW",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: white,
                fontFamily: font,
                fontSize: 32.dp,
                wordSpacing: 1,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "FOR 5 NEW VIDEOS",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: white.withOpacity(0.8),
                fontFamily: font,
                fontSize: 18.dp,
                wordSpacing: 1,
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
      )),
    );
  }
}
