import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    AudioPlayer advancedPlayer = new AudioPlayer();
    AudioCache audioCache = new AudioCache(fixedPlayer: advancedPlayer);
    final videoPlayer = VideoPlayerController.asset("assets/videos/video.mp4");
    final chewiemanager = ChewieController(
      videoPlayerController: videoPlayer,
      aspectRatio: 1.5,
      autoPlay: true,
      looping: true,
    );
    final videoPlayer1 = VideoPlayerController.network(
        "https://raw.githubusercontent.com/artigencia/flutter_task/master/KARPUR%20GAURAM%20KARUNAVTARAM%20FULL%20SONG%20(DEVON%20KE%20DEV%20MAHADEV).mp4");
    final chewiemanager1 = ChewieController(
      videoPlayerController: videoPlayer1,
      aspectRatio: 1.5,
      autoPlay: true,
      looping: true,
    );

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello'),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.pause),
                        color: Colors.blue,
                        onPressed: () async {
                          await advancedPlayer.pause();
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.play_arrow),
                        color: Colors.green,
                        onPressed: () async {
                          await audioCache.play("audio/theme.mp3");
                        },
                      ),
                    ),
                  ),
                  Center(
                    child: Ink(
                      decoration: const ShapeDecoration(
                        color: Colors.lightBlue,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.stop),
                        color: Colors.red,
                        onPressed: () async {
                          await advancedPlayer.stop();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Chewie(
                  controller: chewiemanager,
                ),
              ),
              Container(
                margin: EdgeInsets.all(20),
                child: Chewie(
                  controller: chewiemanager1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
