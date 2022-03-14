import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/utils/constant_functions.dart';

class PlainTitlewithFormField extends StatelessWidget {
  final String? text;
  final bool? number;
  String hintText;
  Function(String)? function;
  Function(String)? validateForm;

  PlainTitlewithFormField(
      {Key? key,
      this.text,
      this.number = false,
      this.function,
      this.validateForm,
      this.hintText = ''})
      : super(key: key);

  final TextTheme textTheme = TEXT_THEME_DEFAULT;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 72,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(text!, style: textTheme.headline3),
            addVerticalSpace(3),
            TextFormField(
              style: textTheme.headline4,
              keyboardType: number! ? TextInputType.number : TextInputType.name,
              decoration: InputDecoration(
                  hintText: hintText,
                  contentPadding: const EdgeInsets.only(left: 16),
                  errorBorder: InputBorder.none),
              onChanged: (value) {
                if (function != null) {
                  function!(value);
                } else {
                  {}
                }
              },
            )
          ],
        ));
  }
}
