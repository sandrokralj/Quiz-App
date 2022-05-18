import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:quiz_app/screens/score/score_screen.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

// 1 cant feel my face
// 2 adventure of a lifetime
// 3 i want to know what love is
// 4 lose yourself
// 5 uptown funk
// We use get package for our state management

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar
  final assets = <String>["1.mp3", "2.mp3", "3.mp3", "4.mp3", "5.mp3"];
  AnimationController _animationController;
  RxInt animationDuration = 0.obs;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;
  final AssetsAudioPlayer _assetsAudioPlayer = AssetsAudioPlayer();
  var _currentAssetPosition = -1;
  // this will create a instance object of a class
  PageController _pageController;
  PageController get pageController => this._pageController;

  void _open(int assetIndex) {
    _currentAssetPosition = assetIndex;
    _assetsAudioPlayer.open(Audio('assets/music/$_currentAssetPosition.mp3'),
        autoStart: true);
  }

  void _next() {
    _currentAssetPosition++;
    _open(_currentAssetPosition);
    print("$_currentAssetPosition IS THE CURRENT POSITION");
  }

  List<Question> _questions = sample_data
      .map(
        (question) => Question(
            id: question['id'],
            question: question['question'],
            options: question['options'],
            answer: question['answer_index']),
      )
      .toList();
  List<Question> get questions => this._questions;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        animationDuration++;
        update();
      });
    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    _open(1);
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    _assetsAudioPlayer.dispose();
    super.onClose();
    _animationController.dispose();
  }

  void checkAns(Question question, int selectedIndex) {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answer;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) {
      _numOfCorrectAns++;
    }

    // It will stop the counter
    _animationController.stop();
    update();

    // Once user select an ans after 3s it will go to the next qn
    Future.delayed(Duration(milliseconds: 600), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 150), curve: Curves.ease);
      // Reset the counter
      _animationController.reset();
      _next();
      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to navigate another page
      _assetsAudioPlayer.stop();
      Get.to(() => ScoreScreen());
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
