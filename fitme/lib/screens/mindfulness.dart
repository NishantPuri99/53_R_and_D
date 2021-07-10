import 'package:flutter/material.dart';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Mindfulness extends StatefulWidget {
  @override
  _MindfulnessState createState() => _MindfulnessState();
}

class _MindfulnessState extends State<Mindfulness> {
  YoutubePlayerController ytController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    String videoID = YoutubePlayer.convertUrlToId(
        'https://www.youtube.com/watch?v=2OEL4P1Rz04');
    print(videoID);

    ytController = YoutubePlayerController(
      initialVideoId: videoID,
      flags: YoutubePlayerFlags(
        hideControls: true,
        controlsVisibleAtStart: false,
        autoPlay: true,
        mute: false,
        hideThumbnail: true,
        disableDragSeek: true,
        forceHD: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YoutubePlayer(
            controller: ytController,
            showVideoProgressIndicator: false,
          ),
          Container(
            height: double.infinity,
            child: Image.asset(
              'assets/images/candles.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: CircularCountDownTimer(
              width: 200,
              height: 200,
              duration: 50,
              textStyle: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
              fillColor: Colors.red,
              autoStart: true,
              fillGradient: LinearGradient(
                  colors: [Colors.red, Colors.amber, Colors.blue]),
              strokeCap: StrokeCap.round,
              ringColor: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
