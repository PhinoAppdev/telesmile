

// ignore_for_file: must_be_immutable

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  String? videolink;
  VideoPlayerScreen({Key? key, required this.videolink}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  FlickManager? flickManager;
  // VideoPlayerController? _controller;

  @override
  void initState() {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.videolink!),
      autoInitialize: true,
    );
    // _controller = VideoPlayerController.network(
    //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    // );
    super.initState();
  }

  @override
  void dispose() {
    // _controller!.dispose();
    flickManager!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video',style: TextStyle(color: Colors.transparent),),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: FlickVideoPlayer(
        wakelockEnabledFullscreen: true,
        wakelockEnabled: true,
        flickManager: flickManager!,
        preferredDeviceOrientationFullscreen: const [
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ],
      ),
    );
  }
}

// // ignore_for_file: prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors

// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// // import 'dart:ffi';
// import 'package:flutter/services.dart';

// class VideoPage extends StatefulWidget {
//   String? videolink;
//   VideoPage({required this.videolink});

//   @override
//   _VideoPageState createState() => _VideoPageState();
// }

// class _VideoPageState extends State<VideoPage> {
//   VideoPlayerController? _videoPlayerController;
//   ChewieController? _chewieController;
//   final double _aspectRatio = 16 / 9;

//   @override
//   void initState() {
//     super.initState();
//     _videoPlayerController = VideoPlayerController.network(widget.videolink!);
//     _chewieController = ChewieController(
//       allowedScreenSleep: false,
//       // looping: true,
//       allowFullScreen: true,
//       deviceOrientationsAfterFullScreen: [
//         DeviceOrientation.landscapeRight,
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.portraitUp,
//         DeviceOrientation.portraitDown,
//       ],
//       videoPlayerController: _videoPlayerController!,
//       aspectRatio: _aspectRatio,
//       autoInitialize: true,
//       autoPlay: true,
//       showControls: true,
//     );
//     _chewieController!.addListener(
//       () {
//         if (_chewieController!.isFullScreen) {
//           SystemChrome.setPreferredOrientations([
//             DeviceOrientation.landscapeRight,
//             DeviceOrientation.landscapeLeft,
//           ]);
//         } else {
//           SystemChrome.setPreferredOrientations([
//             DeviceOrientation.portraitUp,
//             DeviceOrientation.portraitDown,
//           ]);
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     _videoPlayerController!.dispose();
//     _chewieController!.dispose();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Chewie(
//       controller: _chewieController!,
//     );
//   }
// }
