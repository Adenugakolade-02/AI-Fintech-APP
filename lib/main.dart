import 'package:flutter/material.dart';
import 'package:superlender/utils/constansts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: COLOR_WHITE, textTheme: TEXT_THEME_DEFAULT, fontFamily: 'Poppins'),
      home: Container(),
    );
  }
}