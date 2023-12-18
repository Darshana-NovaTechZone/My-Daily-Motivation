import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:http/http.dart' as http;
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:my_daily_motivation/UI/home/music/play.dart';
import 'package:my_daily_motivation/color/color.dart';
import 'package:audio_session/audio_session.dart';
import 'package:provider/provider.dart';
import '../../../font/font.dart';
import '../../../provider/all_provider.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  Timer? _timer;
  int _start = 10;
  late AudioPlayer player;
  ConcatenatingAudioSource playList = ConcatenatingAudioSource(children: []);
  List<AudioSource> newPlayList = [];
  bool isPlaying = false;
  bool isClickSong = false;
  bool isploading = false;
  Duration duration = Duration.zero;
  String audioTime = '';
  // Duration Position = Duration.zero;
  Duration newDuration = Duration();
  bool loop = false;
  ScrollController _scrollController = ScrollController();
  List audio = [
    {
      'text': 'ENERGY',
      'text2': 'ENERGY',
      'time': '4.42',
      'isfro': 1,
      'a': 'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3'
    },
    {'text': 'INSPIRATIONAL', 'text2': 'Last Tear', 'time': '4.42', 'isfro': 1, 'a': 'https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3'},
    {
      'text': 'FOCUS',
      'text2': 'ENERGY',
      'time': '4.42',
      'isfro': 1,
      'a': 'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3'
    },
    {'text': 'ENERGY', 'text2': 'ENERGY', 'time': '4.42', 'isfro': 2, 'a': 'https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3'},
    {
      'text': 'ENERGY',
      'text2': 'ENERGY',
      'time': '4.42',
      'isfro': 2,
      'a': 'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3'
    },
    {'text': 'ENERGY', 'text2': 'ENERGY', 'time': '4.42', 'isfro': 2, 'a': 'https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3'},
    {
      'text': 'ENERGY',
      'text2': 'ENERGY',
      'time': '4.42',
      'isfro': 1,
      'a': 'https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3'
    },
    {'text': 'ENERGY', 'text2': 'ENERGY', 'time': '4.42', 'isfro': 1, 'a': 'https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3'}
  ];
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    player = AudioPlayer();

    player.positionStream.listen((event) {
      Provider.of<ProviderS>(context, listen: false).position = event;
    });
    player.durationStream.listen((event) {
      print(event);
      Provider.of<ProviderS>(context, listen: false).duration = event!;
    });
    audioList();
    print(player.duration);
  }

  Future<void> _init(ConcatenatingAudioSource playList, int index) async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    // Listen to errors during playback.
    player.playbackEventStream.listen((event) {}, onError: (Object e, StackTrace stackTrace) {
      print('A stream error occurred: $e');
    });
    try {
      await player.setAudioSource(playList);
      await player.setAudioSource(playList[index]!);
    } catch (e, stackTrace) {
      // Catch load errors: 404, invalid url ...
      print("Error loading playlist: $e");
      print(stackTrace);
    }
  }

  audioList() {
    setState(() {
      newPlayList = [
        AudioSource.uri(
          Uri.parse("https://cld2099web.audiovideoweb.com/va90web25003/companions/Foundations%20of%20Rock/13.01.mp3"),
          tag: MediaItem(
            id: '1',
            album: "Science Friday",
            title: "A Salute To Head-Scratching Science",
            artUri: Uri.parse("https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
          ),
        ),
        AudioSource.uri(
          Uri.parse("https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3"),
          tag: MediaItem(
            id: '2',
            album: "Science Friday",
            title: "From Cat Rheology To Operatic Incompetence",
            artUri: Uri.parse("https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
          ),
        ),
        AudioSource.uri(
          Uri.parse("asset:///audio/nature.mp3"),
          tag: MediaItem(
            id: '3',
            album: "Public Domain",
            title: "Nature Sounds",
            artUri: Uri.parse("https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
          ),
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: isClickSong
          ? Consumer<ProviderS>(
              builder: (context, provider, child) => Container(
                color: Color.fromARGB(221, 23, 22, 22),
                height: 120,
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ControlButtons(player),

                    Container(
                      child: LinearProgressIndicator(
                        backgroundColor: Color.fromARGB(221, 35, 34, 34),
                        color: white,
                        value: isClickSong ? provider.position.inSeconds / provider.duration.inSeconds : 0.1,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              player.stop();
                              setState(() {
                                provider.position = Duration(seconds: 0);
                                isClickSong = false;
                              });
                            },
                            icon: Icon(
                              Icons.close,
                              grade: 80,
                              color: white,
                              weight: 500,
                              shadows: [
                                Shadow(
                                  blurRadius: 3,
                                  color: white,
                                )
                              ],
                            )),
                        InkWell(
                          onTap: () {
                            setState(() {
                              playList!.addAll(newPlayList);
                            });
                            audioPlay();
                          },
                          child: Column(
                            children: [
                              Text(
                                "WHO WE WANT TO BE",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: white,
                                  fontFamily: font,
                                  fontSize: 15.dp,
                                  wordSpacing: 1,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "FOCUS",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: white.withOpacity(0.8),
                                  fontFamily: font,
                                  fontSize: 12.dp,
                                  wordSpacing: 1,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   color: Colors.red,
                        //   height: 5,
                        //   width: Position.inSeconds.toDouble(),
                        // ),
                        IconButton(
                            onPressed: () async {
                              if (player.playing) {
                                print('ddddddddddqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
                                setState(() {
                                  isPlaying = false;
                                });
                                await player.pause();
                              } else {
                                setState(() {
                                  isPlaying = true;
                                });
                                player.play();
                              }
                            },
                            icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow_rounded, grade: 80, size: 28, color: white, weight: 500, shadows: [
                              Shadow(
                                blurRadius: 3,
                                color: white,
                              )
                            ])),
                      ],
                    ),
                    Spacer()
                  ],
                ),
              ),
            )
          : SizedBox(),
      backgroundColor: background,
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "MUSIC",
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
            ),
            SizedBox(
              width: w,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: audio.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () async {
                      playList = ConcatenatingAudioSource(children: []);
                      await player.stop();
                      playList = ConcatenatingAudioSource(children: [
                        AudioSource.uri(
                          Uri.parse(audio[index]['a']),
                          tag: MediaItem(
                            id: index.toString(),
                            album: "Science Friday",
                            title: "A Salute To Head-Scratching Science",
                            artUri: Uri.parse("https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg"),
                          ),
                        ),
                      ]);

                      await playList.addAll(newPlayList);
                      _init(playList, index);
                      Provider.of<ProviderS>(context, listen: false).position = Duration(seconds: 0);
                      setState(() {
                        isClickSong = true;
                      });
                      if (player.playing) {
                      } else {
                        setState(() {
                          isPlaying = true;
                        });

                        await player.play();
                      }
                    },
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/3.PNG',
                                height: h / 3,
                                width: w,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              audio[index]['isfro'] == 1
                                  ? Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      color: font_gray,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        child: Text(
                                          'PRO',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: white.withOpacity(0.8),
                                            fontFamily: font,
                                            fontSize: 12.dp,
                                            wordSpacing: 1,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              Text(
                                audio[index]['time'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: white.withOpacity(0.8),
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
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                audio[index]['text'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: white.withOpacity(0.8),
                                  fontFamily: font,
                                  fontSize: 12.dp,
                                  wordSpacing: 1,
                                  letterSpacing: 1.5,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                audio[index]['text2'],
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
                              Container(
                                color: gray,
                                height: 2,
                                width: w / 8,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }

  audioPlay() {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    showGeneralDialog(
      barrierLabel: "Label",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: Duration(milliseconds: 700),
      context: context,
      pageBuilder: (context, anim1, anim2) {
        return StatefulBuilder(builder: (context, Setstate) {
          return GestureDetector(
            onTap: () {},
            child: SafeArea(
              child: Consumer<ProviderS>(
                builder: (context, value, child) => Scaffold(
                  body: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        height: h,
                        width: w,
                        child: Stack(
                          children: [
                            CachedNetworkImage(
                              imageUrl: "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
                              fit: BoxFit.cover,
                              height: h,
                              width: w,
                              progressIndicatorBuilder: (context, url, downloadProgress) =>
                                  SizedBox(height: 20, width: 20, child: CircularProgressIndicator(value: downloadProgress.progress)),
                              errorWidget: (context, url, error) => Icon(Icons.error),
                            ),
                            Container(
                              color: black.withOpacity(0.6),
                            ),
                            Column(children: [
                              SizedBox(
                                height: 25,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Icon(
                                        Icons.expand_more,
                                        color: white.withOpacity(0.9),
                                        size: 35,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          'AGAINST ALL ODOG',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: white.withOpacity(0.9),
                                            fontFamily: font,
                                            fontSize: 18.dp,
                                            wordSpacing: 1,
                                            letterSpacing: 1.5,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'ENERGY',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: white.withOpacity(0.8),
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
                                      width: 30,
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(
                                flex: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  StreamBuilder<SequenceState?>(
                                    stream: player.sequenceStateStream,
                                    builder: (context, snapshot) => IconButton(
                                        icon: Icon(
                                          Icons.skip_previous_rounded,
                                          color: white.withOpacity(0.9),
                                          size: 50,
                                        ),
                                        onPressed: () async {
                                          print('sssssssssssssssssssssssssssssssss${audio[player.currentIndex!]['a']}');
                                          player.stop();
                                          print(player.currentIndex!);
                                          print(playList.length);
                                          await _init(playList, player.currentIndex! - 1);
                                          player.play();
                                        }),
                                  ),
                                  StreamBuilder<PlayerState>(
                                    stream: player.playerStateStream,
                                    builder: (context, snapshot) {
                                      final playerState = snapshot.data;
                                      final processingState = playerState?.processingState;
                                      final playing = playerState?.playing;
                                      if (processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
                                        return Container(
                                          margin: const EdgeInsets.all(8.0),
                                          width: 64.0,
                                          height: 64.0,
                                          child: const CircularProgressIndicator(),
                                        );
                                      } else if (playing != true) {
                                        return IconButton(
                                          icon: const Icon(Icons.play_arrow),
                                          iconSize: 64.0,
                                          color: white.withOpacity(0.9),
                                          onPressed: player.play,
                                        );
                                      } else if (processingState != ProcessingState.completed) {
                                        return IconButton(
                                          icon: const Icon(Icons.pause),
                                          iconSize: 64.0,
                                          color: white.withOpacity(0.9),
                                          onPressed: player.pause,
                                        );
                                      } else {
                                        return IconButton(
                                          icon: const Icon(Icons.replay),
                                          iconSize: 64.0,
                                          color: white.withOpacity(0.9),
                                          onPressed: () => player.seek(Duration.zero, index: player.effectiveIndices!.first),
                                        );
                                      }
                                    },
                                  ),
                                  StreamBuilder<SequenceState?>(
                                    stream: player.sequenceStateStream,
                                    builder: (context, snapshot) => IconButton(
                                        icon: Icon(
                                          Icons.skip_next_rounded,
                                          color: white.withOpacity(0.9),
                                          size: 50,
                                        ),
                                        onPressed: () async {
                                          print('sssssssssssssssssssssssssssssssss${audio[player.currentIndex!]['a']}');
                                          player.stop();
                                          print(player.currentIndex!);
                                          print(playList.length);
                                          await _init(playList, player.currentIndex! + 1);
                                          player.play();
                                        }

                                        // player.hasNext ? player.seekToNext : null,
                                        ),
                                  ),
                                ],
                              ),
                              Spacer(
                                flex: 5,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.share_outlined,
                                        color: white.withOpacity(0.9),
                                        size: 30,
                                      )),
                                  Row(
                                    children: [
                                      Container(
                                        width: w / 2.2,
                                        decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 26, 18, 18),
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(7), bottomLeft: Radius.circular(7))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                    Icons.info,
                                                    color: white.withOpacity(0.4),
                                                    size: 30,
                                                  )),
                                              // IconButton(
                                              //     onPressed: () {},
                                              //     icon: Icon(
                                              //       Icons.repeat_sharp,
                                              //       color: white.withOpacity(0.4),
                                              //       size: 30,
                                              //     )),
                                              StreamBuilder<LoopMode>(
                                                stream: player.loopModeStream,
                                                builder: (context, snapshot) {
                                                  final loopMode = snapshot.data ?? LoopMode.off;
                                                  const icons = [
                                                    Icon(Icons.repeat, color: Colors.grey),
                                                    Icon(Icons.repeat, color: Colors.orange),
                                                    Icon(Icons.repeat_one, color: Colors.orange),
                                                  ];
                                                  const cycleModes = [
                                                    LoopMode.off,
                                                    LoopMode.all,
                                                    LoopMode.one,
                                                  ];
                                                  final index = cycleModes.indexOf(loopMode);
                                                  return IconButton(
                                                    icon: icons[index],
                                                    color: white.withOpacity(0.4),
                                                    onPressed: () {
                                                      player.setLoopMode(cycleModes[(cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: white,
                                            borderRadius: BorderRadius.only(topRight: Radius.circular(7), bottomRight: Radius.circular(7))),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                          child: IconButton(
                                              onPressed: () async {
                                                print('sssssssssssssssssssssssssssssssss${audio[player.currentIndex!]['a']}');
                                                player.stop();
                                                print(player.currentIndex!);
                                                print(playList.length);
                                                await _init(playList, player.currentIndex! + 1);
                                                player.play();
                                              },
                                              icon: Icon(
                                                Icons.skip_next_rounded,
                                                color: black,
                                                size: 30,
                                              )),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.star_border,
                                        color: white.withOpacity(0.9),
                                        size: 30,
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${value.duration.inHours}:${value.duration.inMinutes}:${value.duration.inSeconds.toString()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color.fromARGB(255, 165, 193, 207),
                                        fontFamily: font,
                                        fontSize: 12.dp,
                                        wordSpacing: 1,
                                        letterSpacing: 1.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${value.position.inHours}:${value.position.inMinutes}:${value.position.inSeconds.toString()}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: const Color.fromARGB(255, 165, 193, 207),
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
                              Container(
                                child: LinearProgressIndicator(
                                  backgroundColor: Color.fromARGB(221, 35, 34, 34),
                                  color: white,
                                  value: value.position.inSeconds / value.duration.inSeconds,
                                ),
                              ),
                              SizedBox(
                                height: 25,
                              ),
                            ]),
                          ],
                        ),
                        margin: EdgeInsets.only(bottom: 00, left: 0, right: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(0),
                        )),
                  ),
                ),
              ),
            ),
          );
        });
      },
      transitionBuilder: (context, anim1, anim2, child) {
        return SlideTransition(
          position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
          child: child,
        );
      },
    );
  }
}
