import 'package:flutter/material.dart';

import '../utils/constansts.dart';

class HardCodeProgressionIndicator extends StatelessWidget {
  bool? screenOne;
  bool? screenTwo;

  HardCodeProgressionIndicator({Key? key, this.screenOne = false, this.screenTwo = false}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 96,
      height: 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          circleBar(screenOne!),
          Divider(color : screenTwo!? COLOR_BLUE : const Color(0xFFB9B9C3)),
          circleBar(screenTwo!),
        ],
      )
    );
  }
}
  circleBar(bool isActive) {
    return AnimatedContainer(
    duration: Duration(milliseconds: 150),
    margin: const EdgeInsets.symmetric(horizontal: 8),
    height: isActive ? 12 : 8,
    width: isActive ? 12 : 8,
    decoration: BoxDecoration(
        color: isActive ? COLOR_BLUE : const Color(0xFFB9B9C3),
        borderRadius: const BorderRadius.all(Radius.circular(12))
        ));}
