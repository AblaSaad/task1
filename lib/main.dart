import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Assets Audio Player Example'),
        ),
        body: MyPlayer(),
      ),
    );
  }
}

class MyPlayer extends StatefulWidget {
  @override
  _MyPlayerState createState() => _MyPlayerState();
}

class _MyPlayerState extends State<MyPlayer> {
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(

       children: [

         ListTile(

         leading:Text('Sample 1'),
         trailing:   IconButton(
          icon: isPlaying? Icon(Icons.pause):  Icon(Icons.play_arrow)
        ,
        onPressed: () async {

        await _assetsAudioPlayer.open(
        Audio("assets/sounds/sample1.mp3"),
        );

        },
        ),





        ),
         ListTile(

         leading:Text('Sample 2'),
        trailing:   IconButton(
        icon: isPlaying? Icon(Icons.pause):  Icon(Icons.play_arrow)
        ,
        onPressed: () async {

        await _assetsAudioPlayer.open(
        Audio("assets/sounds/sample2.mp3"),
        );

        },
        ),





        ),
         ListTile(

         leading:Text('Sample 3'),
         trailing:   IconButton(
         icon:  Icon(isPlaying? Icons.pause:  Icons.play_arrow),
         onPressed: () async {

        await _assetsAudioPlayer.open(
        Audio("assets/sounds/sample3.wav"),
        );

        },
        ),





        ) ,
         ListTile(

         leading:Text('Sample 4'),
        trailing:   IconButton(
        icon: isPlaying? Icon(Icons.pause):  Icon(Icons.play_arrow)
        ,
        onPressed: () async {

        await _assetsAudioPlayer.open(
        Audio("assets/sounds/sample4.wav"),
        );

        },
        ),

        ),
         ListTile(

         leading:Text('Sample 5'),
        trailing:   IconButton(
        icon: isPlaying? Icon(Icons.pause):  Icon(Icons.play_arrow)
        ,
        onPressed: () async {

        await _assetsAudioPlayer.open(
        Audio("assets/sounds/sample5.wav"),
        );

        },
        ),

        ),


       ] );

  }
}
