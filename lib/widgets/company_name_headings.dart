import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';

class CompanyHeading extends StatelessWidget {
  TextTheme  textTheme = TEXT_THEME_DEFAULT;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            child: Image.asset('assets/images/Logo Shapes 38.png',fit: BoxFit.contain,),
          ),
          const SizedBox(width:10),
          Text('SUPERLENDER', style: textTheme.headline2,)
        ],
      )
    );
  }
}