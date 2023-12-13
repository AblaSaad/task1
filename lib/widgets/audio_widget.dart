import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioWidgetEx extends StatefulWidget {
  final String fileName;
  final int id;
  final int length;
  const AudioWidgetEx(this.fileName, this.id, this.length, {super.key});

  @override
  State<AudioWidgetEx> createState() => _AudioWidgetExState();
}

class _AudioWidgetExState extends State<AudioWidgetEx> {
  bool isPlaying = false;

  late AssetsAudioPlayer assetsAudioPlayer;

  @override
  void initState() {
    assetsAudioPlayer = AssetsAudioPlayer.withId(widget.id.toString());
    assetsAudioPlayer.open(
        Playlist(audios: [Audio('assets/sounds/${widget.fileName}.mp3')]),
        autoStart: false);

    audiListenerTrigger();

    super.initState();
  }

  void audiListenerTrigger() {
    assetsAudioPlayer.playlistFinished.listen((event) {
      if (event) {
        isPlaying = false;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        tileColor: Colors.pink,
        title: Text(widget.fileName),
        trailing: IconButton(
            onPressed: () {
              if (assetsAudioPlayer.isPlaying.value) {
                assetsAudioPlayer.pause();
              } else {
                for (var i = 0; i < widget.length; i++) {
                  var closedAssetAudioPlayer =
                  AssetsAudioPlayer.withId(i.toString());
                  if (closedAssetAudioPlayer.isPlaying.value) {
                    closedAssetAudioPlayer.stop();
                  }
                }

                assetsAudioPlayer.play();
              }

              setState(() {
                isPlaying = !isPlaying;
              });
            },
            icon: (isPlaying) ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
      ),
    );
  }
}

