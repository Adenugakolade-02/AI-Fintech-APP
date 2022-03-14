import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';

class ShowDialogue{
  final BuildContext context;
  String? result;
  ShowDialogue(this.context,this.result);
  
final TextTheme textTheme = TEXT_THEME_DEFAULT;
void showDialogBox(){
  showDialog(
        context: context,
        builder: (ctx)=>  AlertDialog(
          title: const Text("Prediction"),
          content: result==null? const Center(child: CircularProgressIndicator()): Text(result!, style:textTheme.headline3,),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
            Navigator.of(context).pop();
            },)
      ],)
      );
}
  
}