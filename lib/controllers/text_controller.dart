import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class TextController extends GetxController with SingleGetTickerProviderMixin {
  final textController = TextEditingController();
  RxString controllerText = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    textController.addListener(() {
      controllerText.value = textController.text;
    });
    super.onInit();
  }
}
