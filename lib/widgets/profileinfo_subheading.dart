import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';

class ProfileInfoSubHeadings extends StatelessWidget {
  TextTheme textTheme = TEXT_THEME_DEFAULT;
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          width: width,
          child: FittedBox(
                child: Text(
              "Fill in the data for profile. It will take a",style: textTheme.subtitle1,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal:24),
          width: width,
          child: FittedBox(
            child: Text('of minutes. You only need a passport',style: textTheme.subtitle1,)))
      ],
    );
  }
}