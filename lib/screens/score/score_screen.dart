import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quiz_app/controllers/text_controller.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TextController>();
    QuestionController _qnController = Get.put(QuestionController());
    final _animController = Get.find<QuestionController>();
    var resultPoints = ((_qnController.numOfCorrectAns * 1000) -
        (_animController.animationDuration.value / 10));
    var maxPoints = _qnController.questionNumber * 1000;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset("assets/icons/musicnotes1.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Congrats ${controller.controllerText.value}!",
                style: Theme.of(context).textTheme.headline3.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: shadows),
              ),
              Spacer(),
              Text(
                "${(resultPoints <= 0 ? 0 : resultPoints).toStringAsFixed(0)} / $maxPoints",
                style: Theme.of(context).textTheme.headline2.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: shadows),
              ),
              Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: InkWell(
                  onTap: () {
                    Get.reset();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                    decoration: BoxDecoration(
                      boxShadow: boxShadows,
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "Go Back To The Start",
                      style: Theme.of(context).textTheme.button.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
