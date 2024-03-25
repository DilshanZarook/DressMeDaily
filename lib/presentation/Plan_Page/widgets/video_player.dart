import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class TemperatureBasedVideoWidget extends StatefulWidget {
  final double temperature;

  TemperatureBasedVideoWidget({required this.temperature});

  @override
  _TemperatureBasedVideoWidgetState createState() => _TemperatureBasedVideoWidgetState();
}

class _TemperatureBasedVideoWidgetState extends State<TemperatureBasedVideoWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _initializeController();
  }

  void _initializeController() {
    String videoPath = _selectVideoPath(widget.temperature);
    _controller = VideoPlayerController.asset(videoPath);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.play();
  }

  @override
  void didUpdateWidget(TemperatureBasedVideoWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.temperature != oldWidget.temperature) {
      _controller.dispose();
      _initializeController();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _selectVideoPath(double? temperature) {
    if (temperature == null)
      return 'assets/videos/1.mp4'; // Default video for null temperature
    if (temperature >= 30) {
      return 'assets/videos/2.mp4'; // Replace with your actual video file path
    } else if (temperature >= 20) {
      return 'assets/videos/3.mp4'; // Replace with your actual video file path
    } else if (temperature >= 10) {
      return 'assets/videos/4.mp4'; // Replace with your actual video file path
    } else {
      return 'assets/videos/5.mp4'; // Replace with your actual video file path
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            width: 40,
            // Set the width
            height: 40,
            // Set the height
            color: Colors.transparent,
            // Set the background color to transparent
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            ),
          );
        } else {
          return Container(
            width: 40,
            // Width when loading
            height: 40,
            // Height when loading
            color: Colors.transparent,
            // Set the background color to transparent
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
