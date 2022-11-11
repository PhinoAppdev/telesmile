// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:telesmile/src/constants/loggers.dart';
import 'package:telesmile/src/models/topic_model.dart';
import 'package:telesmile/src/services/http_services.dart';
import 'package:telesmile/src/view/audio/home_audio.dart';

class Blindmode extends GetxController {
  var blind = true.obs;
  var topics = TopicsModel();
  List<AudioSource> audiolinks = [];

  loadTopics(String id) async {
    var result = await getTopicsModel(id: id);
    topics = TopicsModel.fromJson(result!);
  }

  @override
  void onInit() {
    loadTopics('1');
    super.onInit();
  }

  @override
  void onClose() {
    loadTopics('1');
    super.onClose();
  }

  Future duration(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 20),
      () {
        for (var i = 0; i < topics.resultArray![0].topic!.length; i++) {
          audiolinks.add(AudioSource.uri(
              Uri.parse((topics.resultArray![0].topic![i].audioLink!))));
        }
        logger.e("[BlindController] blind value: " + blind.toString());
        if (blind == true) {
          logger.d("[Home Page blind audio data :]" + audiolinks[1].toString());
          logger.d("[HomePage] boolean data: " + blind.toString());
          showDialog(
            context: context,
            builder: (BuildContext context) => HomeAudioPage(
              audiolinks, /*'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'*/
            ),
          );
        }
      },
    );
  }
}
