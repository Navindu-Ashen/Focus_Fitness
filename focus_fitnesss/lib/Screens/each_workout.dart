import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class EachWorkout extends StatefulWidget {
  const EachWorkout({super.key});

  @override
  State<EachWorkout> createState() => _EachWorkoutState();
}

class _EachWorkoutState extends State<EachWorkout> {
  final videoURL = "https://youtu.be/xqvCmoLULNY?si=u8-4-5C1q8OC12QL";

  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        enableCaption: true,
        forceHD: true,
        controlsVisibleAtStart: true,
        showLiveFullscreenButton: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "assets/squat.jpg",
              width: double.infinity,
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    iconSize: 30,
                    color: Colors.white,
                  ),
                  Image.asset(
                  'assets/logo.png',
                  height: 60,
                  width: 60,
                ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                const SizedBox(
                  height: 350,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 61, 61, 61),
                            offset: Offset(0, -5),
                            blurRadius: 12,
                            spreadRadius: 1)
                      ],
                       gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 202, 201, 201),
                          Color.fromARGB(255, 104, 104, 104)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 30),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(height: 16,),
                            const Text(
                              "More about",
                              style: TextStyle(
                                  fontSize: 16.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "Squats",
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w900,
                                color: const Color.fromARGB(255, 246, 65, 63),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "How to Squat: The Guide to the Perfect Squat",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 60, 60, 60),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "The squat is a fundamental movement pattern that requires multiple joint and muscle integration. Babies squat perfectly. And then we unlearn this in favor of bending over.",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "Video tutorial :",
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                YoutubePlayer(
                                  controller: _controller,
                                  showVideoProgressIndicator: true,
                                  onReady: () => debugPrint('Ready'),
                                  bottomActions: [
                                    CurrentPosition(),
                                    ProgressBar(
                                      isExpanded: true,
                                      colors: const ProgressBarColors(
                                        playedColor: const Color.fromARGB(
                                            255, 246, 65, 63),
                                        handleColor: const Color.fromARGB(
                                            255, 246, 65, 63),
                                      ),
                                    ),

                                    const PlaybackSpeedButton(),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 30),
                            const Text(
                              "How to :",
                              style: TextStyle(
                                  fontSize: 18,
                                  letterSpacing: 0.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "1.Stand with your feet a little wider than your hips.\n2.Keep your chest proud and your core locked.\n3.Sink your hips back and descend into a squat whilst the knees travel in line with the toes.\n4.At the bottom of the squat, the thighs should hit parallel or lower and your elbows should come in between your knees.\n5.Drive back up, driving through the heels and tensing your glutes at the top.\n6.Repeat.",
                              style: const TextStyle(
                                  fontSize: 17.8,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 40),
                            const Text(
                              "Further instruction meet your instructor!",
                              style: TextStyle(
                                  fontSize: 19,
                                  letterSpacing: 0.5,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30, left: 40, right: 40),
                              child: Column(
                                children: [
                                  Image.asset(
                                    'assets/logo.png',
                                    height: 120,
                                    width: 120,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 16,)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
