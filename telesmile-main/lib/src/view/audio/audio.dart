//ignore_for_file: must_be_immutable, avoid_print;
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:rxdart/rxdart.dart';
import 'package:telesmile/src/view/audio/seek_bar.dart';
import 'package:telesmile/src/view/widgets/widgets.dart';

import 'audio_player_buttons.dart';

class AudioPage extends StatefulWidget {
  String? audiolink;

  AudioPage({Key? key, this.audiolink}) : super(key: key);

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  AudioPlayer? _audioPlayer;
  // late Stream<DurationState> _durationState;
  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    // _durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
    //     _audioPlayer!.positionStream,
    //     _audioPlayer!.playbackEventStream,
    //     (position, playbackEvent) => DurationState(
    //           progress: position,
    //           buffered: playbackEvent.bufferedPosition,
    //           total: playbackEvent.duration,
    //         ));
    _audioPlayer!.setAudioSource(
      ConcatenatingAudioSource(children: [
        AudioSource.uri(
          Uri.parse(widget
              .audiolink! /*'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'*/),
        )
      ]),
    );
  }

  @override
  void dispose() {
    _audioPlayer!.dispose();
    super.dispose();
  }

     Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _audioPlayer!.positionStream,
          _audioPlayer!.bufferedPositionStream,
          _audioPlayer!.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    _audioPlayer!.play();
    return Scaffold(
      appBar: Header('Audio'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Image(
              image: AssetImage(
                'assets/Group 21.png',
              ),
            ),
          ),
          StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return SeekBar(
                    duration: positionData?.duration ?? Duration.zero,
                    position: positionData?.position ?? Duration.zero,
                    bufferedPosition:
                        positionData?.bufferedPosition ?? Duration.zero,
                    onChangeEnd: _audioPlayer!.seek,
                  );
                },
              ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
          //   child: _progressBar(),
          // ),
          PlayerButtons(_audioPlayer!)
        ],
      ),
    );
  }

//   StreamBuilder<DurationState> _progressBar() {
//     return StreamBuilder<DurationState>(
//       stream: _durationState,
//       builder: (context, snapshot) {
//         final durationState = snapshot.data;
//         final progress = durationState?.progress ?? Duration.zero;
//         final buffered = durationState?.buffered ?? Duration.zero;
//         final total = durationState?.total ?? Duration.zero;
//         return ProgressBar(
//           progress: progress,
//           buffered: buffered,
//           total: total,
//           onSeek: (duration) {
//             _audioPlayer!.seek(duration);
//           },
//           onDragUpdate: (details) {
//             debugPrint('${details.timeStamp}, ${details.localPosition}');
//           },
//         );
//       },
//     );
//   }
}

// class DurationState {
//   const DurationState({
//     required this.progress,
//     required this.buffered,
//     this.total,
//   });
//   final Duration progress;
//   final Duration buffered;
//   final Duration? total;
// }
