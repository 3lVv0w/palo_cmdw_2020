import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class AnimatedTextCon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      child: TypewriterAnimatedTextKit(
        speed: Duration(milliseconds: 500),
        totalRepeatCount: 4,
        text: [
          "Tech as a Force for Good",
        ],
        textStyle: TextStyle(fontSize: 22.0, fontWeight: FontWeight.normal),
        pause: Duration(milliseconds: 500),
        displayFullTextOnTap: true,
        stopPauseOnTap: true,
      ),
    );
  }
}
