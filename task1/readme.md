# How to add video and audio in Flutter App

### What is **Flutter**?

> Flutter is an open-source UI software development kit created by Google. It is used to develop applications for Android, iOS, Linux, Mac, Windows, Google Fuchsia and the web from a single codebase.

> Flutter apps are written in the Dart language and make use of many of the language's more advanced features. Darsyntax t language just like Javascripts syntax.

---
if you dont setup in flutter. Check out [Install Guide](https://flutter.dev/docs/get-started/install "Install Guide"). 

Note :- Make sure run `flutter doctor` if goes well before starting  it


### Create the flutter app

> Create Flutter app named called auivio and create it using shell or cmd

```shell
$ flutter create auivio
```

> Make sure to run app in your phone and run the shell below it

```shell
$ cd auivio 
$ flutter run
```
if it is working then it is good to go

if you are using vscode then open the folder using shell 

```shell
$ code .
```  

> You’ll mostly edit **lib/main.dart**, where the Dart code lives.

> Replace the contents of **lib/main.dart**.
Delete all of the code from **lib/main.dart**. Replace with the following code, which displays “Hello World” in the center of the screen.


```dart
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

> you will need make new folder called assets which store image, video etc and also create audio folder and video folder  to collect video or music file
`make sure copy and paste it any video and audio files`


```shell
$ mkdir assets
$ mkdir assets/audio
$ mkdir assets/video
```


> We need library audio and video from pub.dev website and add two dependencies ( audioplayers, chewie, and videoplayer) to 
`pubspec.yaml` 


```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^0.1.2
  audioplayers: ^0.15.1
  video_player: ^0.10.11+2
  chewie: ^0.9.10

flutter:
  uses-material-design: true
  assets:
  - assets/video
  - assets/audio
```

> and add import library 

```dart
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:chewie/chewie.dart';
```


> make audio and video code below

```dart
AudioPlayer advancedPlayer = new AudioPlayer();

AudioCache audioCache = new AudioCache(fixedPlayer: advancedPlayer);

final videoPlayer = VideoPlayerController.asset("assets/videos/video.mp4");

final chewiemanager = ChewieController(
    videoPlayerController: videoPlayer,
    aspectRatio: 1.5,
    autoPlay: true,
    looping: true,
);
final videoPlayer1 = VideoPlayerController.network("https://raw.githubusercontent.com/artigencia/flutter_task/master/KARPUR%20GAURAM%20KARUNAVTARAM%20FULL%20SONG%20(DEVON%20KE%20DEV%20MAHADEV).mp4");

final chewiemanager1 = ChewieController(
    videoPlayerController: videoPlayer1,
    aspectRatio: 1.5,
    autoPlay: true,
    looping: true,
    );
```

> Now, We are going to add play, pause and stop  icons code below 

```dart
child: Ink(
        decoration: const ShapeDecoration(
        color: Colors.lightBlue,
        shape: CircleBorder(),
        ),
        child: IconButton(
        icon: Icon(Icons.pause),
        color: Colors.blue,
        onPressed: () async {
            await //puase, stop, play function
        },
    ),
),
```



> we have to add  3 buttom in columns using row 

```dart
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
            );
```
> Now we need add video controller called ChewieController to flutter

```dart
// assets
 Container(
    margin: EdgeInsets.all(20),
    child: Chewie(
        controller: chewiemanager,
    ),
    ),
// network url
    Container(
    margin: EdgeInsets.all(20),
    child: Chewie(
        controller: chewiemanager1,
    ), 
```

>   **Finally**

> Together the code Below

```dart 
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
```
