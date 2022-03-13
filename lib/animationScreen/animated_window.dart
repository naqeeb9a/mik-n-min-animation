import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miknmin_animation/MainScreen/home_page.dart';
import 'package:miknmin_animation/SparkleAnimation/sparkle.dart';

class AnimatedWindow extends StatefulWidget {
  const AnimatedWindow({Key? key}) : super(key: key);

  @override
  State<AnimatedWindow> createState() => _AnimatedWindowState();
}

class _AnimatedWindowState extends State<AnimatedWindow> {
  double value = 0;

  startAnimation() {
    Timer.periodic(const Duration(milliseconds: 20), (timerValue) {
      if (value < 1) {
        setState(() {
          value = value + 0.01;
        });
      } else {
        timerValue.cancel();
        Get.to(() => const HomePage(),
            transition: Transition.circularReveal,
            duration: const Duration(seconds: 2));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: InkWell(
        onTap: () {
          startAnimation();
        },
        child: Stack(
          children: [
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardContainer(
                  value: value,
                ),
              ],
            )),
            AnimatedPositioned(
              duration: const Duration(seconds: 1),
              top: value >= 0.5 ? 0 : 50,
              right: value >= 0.5 ? 0 : 20,
              child: AnimatedOpacity(
                  duration: const Duration(seconds: 1),
                  opacity: value >= 0.5 ? 0 : 1,
                  child: Image.asset(
                    "assets/sun.png",
                    width: MediaQuery.of(context).size.width * 0.2,
                  )),
            ),
            const Sparkling()
          ],
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  final double value;
  const CardContainer({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color sizedColor = Colors.brown;
    double sizedHeigth = 10;
    double containerWidth = 200;
    double containerHeigth = 200;
    return Transform.scale(
      scale: (value > 0.5) ? value * 2 : 1,
      child: Container(
        color: Colors.brown.shade900,
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.white,
              Color(0XFFFD2A68),
              Color(0xFF8C8C8C),
              Color(0xFF18B8E0),
              Colors.white,
            ], transform: GradientRotation(pi)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(pi * -value),
                child: Container(
                  color: Colors.brown,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        height: containerHeigth,
                        width: containerWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/shirt.jpg"),
                          ),
                        ),
                      ),
                      Container(color: sizedColor, height: sizedHeigth),
                      Container(
                        height: containerHeigth,
                        width: containerWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/qoute.jpg"),
                          ),
                        ),
                      ),
                      Container(color: sizedColor, height: sizedHeigth),
                      Container(
                        height: containerHeigth,
                        width: containerWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/shirt2.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(pi * value),
                child: Container(
                  color: Colors.brown,
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Container(
                        height: containerHeigth,
                        width: containerWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/shirt3.jpg"),
                          ),
                        ),
                      ),
                      Container(color: sizedColor, height: sizedHeigth),
                      Container(
                        height: containerHeigth,
                        width: containerWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/qoute1.jpg"),
                          ),
                        ),
                      ),
                      Container(color: sizedColor, height: sizedHeigth),
                      Container(
                        height: containerHeigth,
                        width: containerWidth,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/shirt5.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
