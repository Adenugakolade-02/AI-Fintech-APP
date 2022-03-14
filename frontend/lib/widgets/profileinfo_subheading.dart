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
              "Fill in the details for loan application,",style: textTheme.subtitle1,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal:24),
          width: width,
          child: FittedBox(
            child: Text('It will take a couple of minutes',style: textTheme.subtitle1,)))
      ],
    );
  }
}