import 'package:demo/src/demo-audio/demo-audio.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DemoVideo extends StatefulWidget {
  const DemoVideo({super.key});

  @override
  State<DemoVideo> createState() => _DemoVideoState();
}

class _DemoVideoState extends State<DemoVideo> {
  late VideoPlayerController _videoPlayerController;
  Duration position = Duration();
  Duration duration = Duration();

  @override
  void initState() {
    // Khởi tạo video controller
    _videoPlayerController =
        VideoPlayerController.asset('assets/video/video.mp4')
          ..setLooping(true) // đặt vòng lặp
          ..initialize() // khởi tạo
              .then((_) {
                setState(() {
                  position = _videoPlayerController.value.position;
                  duration = _videoPlayerController.value.duration;
                });
              });

    //observer lắng nghe rồi cập nhật UI
    _videoPlayerController.addListener(() {
      setState(() {
        position = _videoPlayerController.value.position;
        duration = _videoPlayerController.value.duration;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:
            _videoPlayerController.value.isInitialized
                ? Column(
                  children: [
                    AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(formatTime(position)),
                          Text(formatTime(duration - position)),
                        ],
                      ),
                    ),
                  ],
                )
                : Container(),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 10,
        children: [
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _videoPlayerController.value.isPlaying
                    ? _videoPlayerController.pause()
                    : _videoPlayerController.play();
              });
            },
            child: Icon(
              _videoPlayerController.value.isPlaying
                  ? Icons.pause
                  : Icons.play_arrow,
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _videoPlayerController.seekTo(Duration.zero);
              });
            },
            child: Icon(Icons.restore),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                _videoPlayerController.value.volume == 0.0
                    ? _videoPlayerController.setVolume(1.0)
                    : _videoPlayerController.setVolume(0.0);
              });
            },
            child: Icon(
              _videoPlayerController.value.volume == 0.0
                    ? Icons.volume_down
                    : Icons.volume_mute_sharp
            ),
          ),
        ],
      ),
    );
  }
}
