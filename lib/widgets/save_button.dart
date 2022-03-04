import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';
import 'package:superlender/utils/constant_functions.dart';

class SaveButton extends StatelessWidget {
  Function()? function;
  SaveButton({Key? key, this.function}) : super(key: key);
  
  @override
  TextTheme textTheme = TEXT_THEME_DEFAULT;
  Widget build(BuildContext context) {
    return SizedBox(
      width: 128,
      child: ElevatedButton(
        onPressed: function ?? (){},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Icon(Icons.check, color: COLOR_WHITE),
            addHorizontalSpace(8),
            const Text('Save',style: TextStyle(color: COLOR_WHITE, fontWeight: FontWeight.w500, fontSize: 16),),
          ],
        ),
        
        style: ElevatedButton.styleFrom(
          // padding: const EdgeInsets.symmetric(horizontal:38),
          primary: COLOR_BLUE,
          shape:const RoundedRectangleBorder(
            side : BorderSide(color: COLOR_GREY)
          )
        ),
      ),
    );
  }
}