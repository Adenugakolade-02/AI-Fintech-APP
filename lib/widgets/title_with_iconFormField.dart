import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/utils/constant_functions.dart';

class TitlewithIconFormField extends StatelessWidget {
  final String text;
  final bool? number;
  final IconButton iconButton;

  const TitlewithIconFormField({Key? key, required this.text, this.number = false,required this.iconButton}) : super(key: key);
  
  final TextTheme textTheme = TEXT_THEME_DEFAULT;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(text, style: textTheme.headline3),
          addVerticalSpace(3),
          TextFormField(
            style: textTheme.headline4,
            keyboardType:number!? TextInputType.name: TextInputType.number ,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left:16),
              suffixIcon: iconButton
            ),
          )
        ],)
    );
  }
}