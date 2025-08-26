// ignore_for_file: library_private_types_in_public_api

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

String formatTime(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, "0");
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return duration.inHours > 0
      ? "$hours:$minutes:$seconds"
      : "$minutes:$seconds";
}

class DemoAudio extends StatefulWidget {
  const DemoAudio({super.key});

  @override
  _DemoAudioState createState() => _DemoAudioState();
}

class _DemoAudioState extends State<DemoAudio> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    //Bắt buộc phải đăng kí 3 stream trong initState vì khi viết ngoài,cụ thể dưới postion, vì
    //phần đó không phải biểu thức thực thi, stream sẽ ko đc đăng kí, phần trên chỉ để định nghĩa biến giá trị

    // Lấy tổng thời lượng
    audioPlayer.onDurationChanged.listen((d) {
      setState(() => duration = d);
    });

    // Lấy vị trí hiện tại
    audioPlayer.onPositionChanged.listen((p) {
      setState(() => position = p);
    });

    // Nghe khi trạng thái thay đổi
    audioPlayer.onPlayerStateChanged.listen((s) {
      setState(() => isPlaying = s == PlayerState.playing);
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(color: Colors.blue),
              width: 100,
              height: 100,
            ),
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble().clamp(0, duration.inSeconds.toDouble()),
              onChanged: (value) async {
                final newPosition = Duration(seconds: value.toInt());
                await audioPlayer.seek(newPosition);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(formatTime(position)), // thời gian đã chạy
                  Text(formatTime(duration - position)), // thời gian còn lại
                ],
              ),
            ),
            IconButton(
              onPressed: () async {
                if (isPlaying) {
                  await audioPlayer.pause();
                } else {
                  await audioPlayer.play(AssetSource('audio/audio.mp3'));
                }
              },
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
            ),
          ],
        ),
      ),
    );
  }
}
