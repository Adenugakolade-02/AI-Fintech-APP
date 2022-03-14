import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/utils/constant_functions.dart';

class NavigatorButton extends StatelessWidget {
  Function()? function;
  NavigatorButton({Key? key, this.function}) : super(key: key);

  @override


  @override
  TextTheme textTheme = TEXT_THEME_DEFAULT;

  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Go Next',style: textTheme.headline6,),
            addHorizontalSpace(8),
            const Icon(Icons.keyboard_arrow_right,color: COLOR_HEADINGS_BLACK,)
          ],
        ),
        
        style: ElevatedButton.styleFrom(
          
          primary: COLOR_WHITE,
          shape:const RoundedRectangleBorder(
            side : BorderSide(color: COLOR_GREY)
          )
        ),
      ),
    );
  }
}