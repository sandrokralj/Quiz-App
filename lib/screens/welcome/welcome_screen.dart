import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/controllers/text_controller.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  final controller = Get.put(TextController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        centerTitle: true,
        title: Text(
          "PulsedMusic",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color(0xFF1C2341),
            //shadows: shadows,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Dialog(
                      backgroundColor: kSecondaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      elevation: 16,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        width: 50,
                        height: 200,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "The goal of the game is to get the correct answer as soon as possible.\n"
                                "The less seconds you take to answer, the more points you get.\n"
                                "Start guessing!",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline4
                                    .copyWith(
                                      color: Color(0xFF1C2341),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              icon: Icon(
                Icons.info,
                color: Color(0xFF1C2341),
                size: 40,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/musicnotes1.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 2), //2/6
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Let's play!",
                      style: Theme.of(context).textTheme.headline3.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: shadows),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Text(
                  //     "Let's play!",
                  //     style: TextStyle(shadows: shadows, fontSize: 24),
                  //   ),
                  // ),
                  Spacer(), // 1/6
                  TextField(
                    controller: controller.textController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Your Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () {
                      Get.to(() => QuizScreen());
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Start Game",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Color(0xFF1C2341), fontSize: 24),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
