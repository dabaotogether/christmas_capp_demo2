// ignore: file_names
// ignore_for_file: file_names

import 'package:christmas_capp/screens/FirstScreen.dart';
import 'package:circular_countdown/circular_countdown.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    // assetsAudioPlayer.open(
    //   Audio("audio/JingleBells.mp3"),
    // );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: animation.value,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: TimeCircularCountdown(
                diameter: 200,
                textStyle: const TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.lightBlueAccent,
                  fontSize: 80.0,
                  fontWeight: FontWeight.bold,
                ),
                countdownRemainingColor: Colors.orangeAccent,
                countdownCurrentColor: Colors.lightBlueAccent,
                unit: CountdownUnit.second,
                countdownTotal: 5,

                onUpdated: (unit, remainingTime) {
                  if (remainingTime == 1) {
                    Navigator.push(
                        context,
                        PageTransition(
                            duration: const Duration(milliseconds: 1100),
                            curve: Curves.ease,
                            type: PageTransitionType.rotate,
                            alignment: Alignment.center,
                            child: FirstScreen()));
                  }
                },
                // onFinished: () {
                //   Navigator.push(
                //       context,
                //       PageTransition(
                //           duration: const Duration(milliseconds: 1000),
                //           type: PageTransitionType.fade,
                //           child: FirstScreen()));
                // },
              ),
            ),
            // AnimatedTextKit(
            //   repeatForever: true,
            //   animatedTexts: [
            //     FlickerAnimatedText(
            //       'Are you ready?',
            //       textStyle: const TextStyle(
            //         fontFamily: "Montserrat",
            //         color: Colors.lightBlueAccent,
            //         fontSize: 40.0,
            //         fontWeight: FontWeight.bold,
            //       ),
            //       speed: const Duration(milliseconds: 100),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
