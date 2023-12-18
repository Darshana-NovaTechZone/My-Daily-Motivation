// import 'dart:developer';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// /// Creates [YouTubeScreen] widget.
// class YouTubeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Youtube Player Flutter',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         appBarTheme: const AppBarTheme(
//           color: Colors.blueAccent,
//           titleTextStyle: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.w300,
//             fontSize: 20,
//           ),
//         ),
//         iconTheme: const IconThemeData(
//           color: Colors.blueAccent,
//         ),
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// /// Homepage
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   late YoutubePlayerController _controller;
//   late TextEditingController _idController;
//   late TextEditingController _seekToController;
//   List<YoutubePlayerController> ytb = [];
//   late PlayerState _playerState;
//   late YoutubeMetaData _videoMetaData;
//   double _volume = 100;
//   bool _muted = false;
//   bool _isPlayerReady = false;

//   final List<String> _ids = [
//     'nPt8bK2gbaU',
//     'gQDByCdjUXw',
//     'iLnmTe5Q2Qw',
//     '_WoCV4c6XOE',
//     'KmzdUe0RSJo',
//     '6jZDSSZZxjQ',
//     'p2lYr3vM_1w',
//     '7QUtEmBT_-w',
//     '34_PXCzGw1M',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _controller = YoutubePlayerController(
//       initialVideoId: _ids.first,
//       flags: const YoutubePlayerFlags(
//         mute: false,
//         autoPlay: true,
//         disableDragSeek: false,
//         loop: false,
//         isLive: false,
//         forceHD: false,
//         enableCaption: true,
//       ),
//     )..addListener(listener);
//     _idController = TextEditingController();
//     _seekToController = TextEditingController();
//     _videoMetaData = const YoutubeMetaData();
//     _playerState = PlayerState.unknown;
//   }

//   void listener() {
//     if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
//       setState(() {
//         _playerState = _controller.value.playerState;
//         _videoMetaData = _controller.metadata;
//       });
//     }
//   }

//   @override
//   void deactivate() {
//     // Pauses video while navigating to next page.
//     _controller.pause();
//     super.deactivate();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     _idController.dispose();
//     _seekToController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var h = MediaQuery.of(context).size.height;
//     var w = MediaQuery.of(context).size.width;
//     return YoutubePlayerBuilder(
//       onExitFullScreen: () {
//         // The player forces portraitUp after exiting fullscreen. This overrides the behaviour.
//         SystemChrome.setPreferredOrientations(DeviceOrientation.values);
//       },
//       player: YoutubePlayer(
//         controller: _controller,
//         showVideoProgressIndicator: true,
//         progressIndicatorColor: Colors.blueAccent,
//         topActions: <Widget>[
//           const SizedBox(width: 8.0),
//           Expanded(
//             child: Text(
//               _controller.metadata.title,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 18.0,
//               ),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 1,
//             ),
//           ),
//           IconButton(
//             icon: const Icon(
//               Icons.settings,
//               color: Colors.white,
//               size: 25.0,
//             ),
//             onPressed: () {
//               log('Settings Tapped!');
//             },
//           ),
//         ],
//         onReady: () {
//           _isPlayerReady = true;
//         },
//         onEnded: (data) {
//           _controller.load(_ids[(_ids.indexOf(data.videoId) + 1) % _ids.length]);
//           _showSnackBar('Next Video Started!');
//         },
//       ),
//       builder: (context, player) => Scaffold(
//           appBar: AppBar(
//             leading: Padding(
//               padding: const EdgeInsets.only(left: 12.0),
//               child: Image.asset(
//                 'assets/ypf.png',
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//             title: const Text(
//               'Youtube Player Flutter',
//               style: TextStyle(color: Colors.white),
//             ),
//             actions: [
//               // IconButton(
//               //   icon: const Icon(Icons.video_library),
//               //   onPressed: () => Navigator.push(
//               //     context,
//               //     CupertinoPageRoute(
//               //       builder: (context) => VideoList(),
//               //     ),
//               //   ),
//               // ),
//             ],
//           ),
//           body: SizedBox(
//             height: h,
//             child: ListView.builder(
//               itemCount: 1,
//               itemBuilder: (context, index) {
//                 return ListView(
//                   children: [
//                     player,
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           _space,
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               IconButton(
//                                 icon: const Icon(Icons.skip_previous),
//                                 onPressed: _isPlayerReady
//                                     ? () => _controller.load(_ids[(_ids.indexOf(_controller.metadata.videoId) - 1) % _ids.length])
//                                     : null,
//                               ),
//                               IconButton(
//                                 icon: Icon(
//                                   _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//                                 ),
//                                 onPressed: _isPlayerReady
//                                     ? () {
//                                         _controller.value.isPlaying ? _controller.pause() : _controller.play();
//                                         setState(() {});
//                                       }
//                                     : null,
//                               ),
//                               IconButton(
//                                 icon: Icon(_muted ? Icons.volume_off : Icons.volume_up),
//                                 onPressed: _isPlayerReady
//                                     ? () {
//                                         _muted ? _controller.unMute() : _controller.mute();
//                                         setState(() {
//                                           _muted = !_muted;
//                                         });
//                                       }
//                                     : null,
//                               ),
//                               FullScreenButton(
//                                 controller: _controller,
//                                 color: Colors.blueAccent,
//                               ),
//                               IconButton(
//                                 icon: const Icon(Icons.skip_next),
//                                 onPressed: _isPlayerReady
//                                     ? () => _controller.load(_ids[(_ids.indexOf(_controller.metadata.videoId) + 1) % _ids.length])
//                                     : null,
//                               ),
//                               SizedBox(
//                                 width: 100,
//                                 child: Slider(
//                                   inactiveColor: Colors.transparent,
//                                   value: _volume,
//                                   min: 0.0,
//                                   max: 100.0,
//                                   divisions: 10,
//                                   label: '${(_volume).round()}',
//                                   onChanged: _isPlayerReady
//                                       ? (value) {
//                                           setState(() {
//                                             _volume = value;
//                                           });
//                                           _controller.setVolume(_volume.round());
//                                         }
//                                       : null,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           _space,
//                         ],
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           )),
//     );
//   }

//   Widget _text(String title, String value) {
//     return RichText(
//       text: TextSpan(
//         text: '$title : ',
//         style: const TextStyle(
//           color: Colors.blueAccent,
//           fontWeight: FontWeight.bold,
//         ),
//         children: [
//           TextSpan(
//             text: value,
//             style: const TextStyle(
//               color: Colors.blueAccent,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Color _getStateColor(PlayerState state) {
//     switch (state) {
//       case PlayerState.unknown:
//         return Colors.grey[700]!;
//       case PlayerState.unStarted:
//         return Colors.pink;
//       case PlayerState.ended:
//         return Colors.red;
//       case PlayerState.playing:
//         return Colors.blueAccent;
//       case PlayerState.paused:
//         return Colors.orange;
//       case PlayerState.buffering:
//         return Colors.yellow;
//       case PlayerState.cued:
//         return Colors.blue[900]!;
//       default:
//         return Colors.blue;
//     }
//   }

//   Widget get _space => const SizedBox(height: 10);

//   Widget _loadCueButton(String action) {
//     return Expanded(
//       child: MaterialButton(
//         color: Colors.blueAccent,
//         onPressed: _isPlayerReady
//             ? () {
//                 if (_idController.text.isNotEmpty) {
//                   var id = YoutubePlayer.convertUrlToId(
//                         _idController.text,
//                       ) ??
//                       '';
//                   if (action == 'LOAD') _controller.load(id);
//                   if (action == 'CUE') _controller.cue(id);
//                   FocusScope.of(context).requestFocus(FocusNode());
//                 } else {
//                   _showSnackBar('Source can\'t be empty!');
//                 }
//               }
//             : null,
//         disabledColor: Colors.grey,
//         disabledTextColor: Colors.black,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 14.0),
//           child: Text(
//             action,
//             style: const TextStyle(
//               fontSize: 18.0,
//               color: Colors.white,
//               fontWeight: FontWeight.w300,
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }

//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(
//           message,
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontWeight: FontWeight.w300,
//             fontSize: 16.0,
//           ),
//         ),
//         backgroundColor: Colors.blueAccent,
//         behavior: SnackBarBehavior.floating,
//         elevation: 1.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50.0),
//         ),
//       ),
//     );
//   }
// }

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YTC extends StatefulWidget {
  const YTC({Key? key}) : super(key: key);

  @override
  _YTState createState() => _YTState();
}

class _YTState extends State<YTC> {
  late String videoTitle;
  // Url List
  final List<String> _videoUrlList = [
    'https://www.youtube.com/shorts/GBhlhrSOG6E',
    'https://www.youtube.com/shorts/6kgrY9guPow',
    'https://www.youtube.com/shorts/AxwCfLR-FxM',
    'https://www.youtube.com/shorts/sSxRx5It12w',
    'https://www.youtube.com/shorts/wbr68KO-BKA',
  ];

  List<YoutubePlayerController> lYTC = [];

  Map<String, dynamic> cStates = {};

  @override
  void initState() {
    super.initState();
    fillYTlists();
  }

  fillYTlists() {
    for (var element in _videoUrlList) {
      String _id = YoutubePlayer.convertUrlToId(element)!;
      YoutubePlayerController _ytController = YoutubePlayerController(
        initialVideoId: _id,
        flags: const YoutubePlayerFlags(
          mute: true,
          loop: true,
          startAt: 5,
          endAt: 10,
          isLive: false,
          autoPlay: true,
          enableCaption: false,
          disableDragSeek: true,
          controlsVisibleAtStart: false,
          useHybridComposition: false,
          hideControls: true,
        ),
      );

      // _ytController.addListener(() {
      //   print('for $_id got isPlaying state ${_ytController.value.isPlaying}');
      //   if (cStates[_id] != _ytController.value.isPlaying) {
      //     if (mounted) {
      //       setState(() {
      //         cStates[_id] = _ytController.value.isPlaying;
      //       });
      //     }
      //   }
      // });

      lYTC.add(_ytController);
    }
  }

  @override
  void dispose() {
    for (var element in lYTC) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('YouTube'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu_outlined),
            )
          ],
        ),
        body: SizedBox(
            height: h,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _videoUrlList.length,
              itemBuilder: (context, index) {
                YoutubePlayerController _ytController = lYTC[index];
                String _id = YoutubePlayer.convertUrlToId(_videoUrlList[index])!;
                String curState = 'undefined';
                if (cStates[_id] != null) {
                  curState = cStates[_id] ? 'playing' : 'paused';
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: h / 4,
                          decoration: const BoxDecoration(
                            color: Color(0xfff5f5f5),
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(5)),
                            child: YoutubePlayer(
                              aspectRatio: h,
                              bufferIndicator: Container(),
                              controller: _ytController,
                              showVideoProgressIndicator: false,
                              progressIndicatorColor: Colors.lightBlueAccent,
                              bottomActions: [
                                CurrentPosition(),
                                ProgressBar(isExpanded: true),
                                FullScreenButton(),
                              ],
                              onReady: () {
                                print('onReady for $index');
                              },
                              onEnded: (YoutubeMetaData _md) {
                                _ytController.seekTo(const Duration(seconds: 0));
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
