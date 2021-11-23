// ignore: file_names
// ignore_for_file: file_names
import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:christmas_capp/screens/FirstScreen.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({Key? key}) : super(key: key);

  @override
  _FourthScreenTState createState() => _FourthScreenTState();
}

class _FourthScreenTState extends State<FourthScreen>
    with TickerProviderStateMixin {
  late ConfettiController _controllerBottomCenter;

  @override
  void initState() {
    super.initState();
    _controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerBottomCenter.play();
  }

  @override
  void dispose() {
    _controllerBottomCenter.dispose();
    super.dispose();
  }

  Image _image = Image.asset('images/heart.png');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: animation.value,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/image4.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(color: Colors.grey.withOpacity(0.5)),
            AnimatedBackground(
              behaviour: RandomParticleBehaviour(
                  options: ParticleOptions(
                image: _image,
                spawnMinRadius: 5.0,
                spawnMaxRadius: 10.0,
                particleCount: 120,
                baseColor: Colors.white54,
              )),
              vsync: this,
              child: const Text(''),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: AnimatedTextKit(
                      pause: const Duration(milliseconds: 500),
                      animatedTexts: [
                        RotateAnimatedText(
                          '',
                          duration: const Duration(milliseconds: 1000),
                        ),
                        RotateAnimatedText(
                          'To make our special day an even more meaningful one, I made a donation to <XXX>',
                          duration: const Duration(milliseconds: 4000),
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(
                            fontFamily: "Kalam",
                            color: Colors.black,
                            fontSize: 28,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        RotateAnimatedText(
                          'I love u - dear dear - to the moon and back.',
                          duration: const Duration(milliseconds: 4000),
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(
                            fontFamily: "Kalam",
                            color: Colors.black,
                            fontSize: 28,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                      isRepeatingAnimation: false,
                      onFinished: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                duration: const Duration(milliseconds: 1500),
                                type: PageTransitionType.fade,
                                child: FirstScreen()));
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ConfettiWidget(
                confettiController: _controllerBottomCenter,
                blastDirection: -pi / 2,
                blastDirectionality: BlastDirectionality.explosive,
                emissionFrequency: 1,
                numberOfParticles: 8,
                maxBlastForce: 80,
                minBlastForce: 30,
                shouldLoop: true,
                gravity: 0.4,
                colors: const [
                  Colors.green,
                  Colors.red,
                  Colors.white,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
